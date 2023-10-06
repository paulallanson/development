object STPODM: TSTPODM
  Height = 480
  Width = 785
  object qryInsPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord'
      
        '(Purch_Ord, Purch_Ord_Descr, Part_Store, Purch_Ord_Rec_Ref, Supp' +
        'lier, Branch_No,'
      
        ' Purch_Ord_No, Purch_Ord_Status, Purch_Ord_Date, Part_Store_From' +
        ', Purch_Ord_Type,'
      ' Supp_Order_Type, Date_Required, Sales_Order, Narrative)'
      'Values'
      
        '(:Purch_Ord, :Purch_Ord_Descr, :Part_Store, :Purch_Ord_Rec_Ref, ' +
        ':Supplier, :Branch_No,'
      
        ' :Purch_Ord_No, :Purch_Ord_Status, :Purch_Ord_Date, :Part_Store_' +
        'From, :Purch_Ord_Type,'
      ' :Supp_Order_Type, :Date_Required, :Sales_Order, :Narrative)'
      ' '
      ' ')
    Left = 16
    Top = 8
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Descr'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Purch_Ord_Rec_Ref'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Purch_Ord_No'
      end
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord_Date'
      end
      item
        Name = 'Part_Store_From'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Purch_Ord_Type'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_Type'
        DataType = ftString
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Narrative'
      end>
  end
  object qryUpdPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set'
      'Purch_Ord_Descr = :Purch_Ord_Descr,'
      'Part_Store = :Part_Store,'
      'Purch_Ord_Rec_Ref = :Purch_Ord_Rec_Ref,'
      'Supplier = :Supplier,'
      'Branch_No = :Branch_No,'
      'Purch_Ord_No = :Purch_Ord_No,'
      'Purch_Ord_Status = :Purch_Ord_Status,'
      'Purch_Ord_Date = :Purch_Ord_Date,'
      'Part_Store_From = :Part_Store_From,'
      'Purch_Ord_Type = :Purch_Ord_Type,'
      'Sales_Order = :Sales_Order,'
      'Supp_Order_Type = :Supp_Order_Type,'
      'Date_Required = :Date_Required,'
      'Version_no = :Version_no,'
      'Supplier_Ack_Number = :Supplier_Ack_Number'
      'Where'
      '(Purch_Ord = :Purch_Ord) '
      ' '
      ' ')
    Left = 104
    Top = 8
    ParamData = <
      item
        Name = 'Purch_Ord_Descr'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Purch_Ord_Rec_Ref'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Purch_Ord_No'
      end
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord_Date'
      end
      item
        Name = 'Part_Store_From'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord_Type'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_Type'
        DataType = ftString
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Version_no'
      end
      item
        Name = 'Supplier_Ack_Number'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryDelPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE '
      'FROM Purch_Ord '
      'WHERE Purch_Ord = :Purch_Ord')
    Left = 280
    Top = 8
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetLastPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Purch_Ord) as Last_Code'
      'From Purch_Ord'
      ' '
      ' '
      ' ')
    Left = 16
    Top = 168
  end
  object qryInsPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord_Line'
      
        '(Purch_Ord, Purch_Ord_Line_No, Quantity_Allocated, Fully_Receive' +
        'd,'
      ' Quantity_Ordered, Part, Quantity_Received,'
      ' Date_Deliv_Expected, Date_Deliv_Actual, Purchase_Price, GRN_No,'
      
        ' Quantity_Sent, Purch_Pack_Quantity, Replacement_For_Line, Disco' +
        'unt, Cost_Price,'
      
        ' Qty_Invoiced, Original_Purchase_Price, Original_Purch_Pack_Qty,' +
        ' Product_Status, Line_Is_Sample)'
      'Values'
      '(:Purch_Ord, :Purch_Ord_Line_No, 0, '#39'N'#39','
      ' :Quantity_Ordered, :Part, :Quantity_Received,'
      
        ' :Date_Deliv_Expected, :Date_Deliv_Actual, :Purchase_Price, :GRN' +
        '_No,'
      
        ' 0,:Purch_Pack_Quantity, :Replacement_For_Line, :Discount, :Cost' +
        '_Price,'
      
        ' :Qty_Invoiced, :Original_Purchase_Price, :Original_Purch_Pack_Q' +
        'ty, :Product_Status, :Line_Is_Sample)'
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
      ' ')
    Left = 16
    Top = 64
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Date_Deliv_Expected'
        DataType = ftDate
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDate
      end
      item
        Name = 'Purchase_Price'
      end
      item
        Name = 'GRN_No'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Replacement_For_Line'
        DataType = ftInteger
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Cost_Price'
        DataType = ftFloat
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Original_Purchase_Price'
      end
      item
        Name = 'Original_Purch_Pack_Qty'
      end
      item
        Name = 'Product_Status'
      end
      item
        Name = 'Line_Is_Sample'
      end>
  end
  object qryUpdPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line'
      'Set'
      '  Part = :Part,'
      '  Quantity_Ordered = :Quantity_Ordered,'
      '  Quantity_Received = :Quantity_Received,'
      '  Date_Deliv_Expected = :Date_Deliv_Expected,'
      '  Date_Deliv_Actual = :Date_Deliv_Actual,'
      '  Purchase_Price = :Purchase_Price,'
      '  GRN_No = :GRN_No,'
      '  Purch_Pack_Quantity = :Purch_Pack_Quantity,'
      '  Replacement_For_Line = :Replacement_For_Line,'
      '  Discount = :Discount,'
      '  Cost_price = :Cost_Price,'
      '  Original_Purchase_Price = :Original_Purchase_Price,'
      '  Original_Purch_Pack_Qty = :Original_Purch_Pack_Qty,'
      '  Product_Status = :Product_Status,'
      '  Line_Is_Sample = :Line_Is_Sample'
      'Where'
      '  (Purch_Ord = :Purch_Ord) and'
      '  (Purch_Ord_Line_No = :Purch_Ord_Line_No)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Date_Deliv_Expected'
        DataType = ftDate
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDate
      end
      item
        Name = 'Purchase_Price'
      end
      item
        Name = 'GRN_No'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Replacement_For_Line'
        DataType = ftInteger
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Cost_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Original_Purchase_Price'
      end
      item
        Name = 'Original_Purch_Pack_Qty'
      end
      item
        Name = 'Product_Status'
      end
      item
        Name = 'Line_Is_Sample'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end>
  end
  object qryGetPOLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord_Line.Part, Purch_Ord_Line.Quantity_Ordered,'
      
        '       Purch_Ord_Line.Quantity_Received, Purch_Ord_Line.Date_Del' +
        'iv_Expected,'
      
        '       Purch_Ord_Line.Date_Deliv_Actual, Purch_Ord_Line.Purch_Pa' +
        'ck_Quantity,'
      '       Part.Part_Description, Purch_Ord_Line.Purch_Ord_Line_No,'
      
        '       Purch_Ord_Line.GRN_No, Purch_Ord_Line.Purchase_Price, Pur' +
        'ch_Ord_Line.Line_Is_Sample'
      'From Purch_Ord_Line, Part'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      '      (Part.Part = Purch_Ord_Line.Part)'
      'Order by Purch_Ord_Line.Part'
      ' '
      ' ')
    Left = 192
    Top = 64
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryDelPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line.Purch_Ord_Line_no = :Purch_Ord_Line_no)'
      ' ')
    Left = 280
    Top = 64
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_no'
      end>
  end
  object qryDelPOLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) '
      ' '
      ' ')
    Left = 360
    Top = 64
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetLastPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Purch_Ord_Line_No) as Last_Code'
      'From Purch_Ord_Line'
      'Where (Purch_Ord = :Purch_Ord)'
      ' '
      ' '
      ' ')
    Left = 448
    Top = 64
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetPartDet: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Part'
      'Where (Part = :Part)')
    Left = 16
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryGetPOTypeDesc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord_Type '
      'WHERE Purch_Ord_Type = :PO_Type;')
    Left = 16
    Top = 280
    ParamData = <
      item
        Name = 'PO_Type'
      end>
  end
  object qryGetSupplierInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Supplier '
      'WHERE Supplier = :Supplier;')
    Left = 192
    Top = 120
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryLastCompnyPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Last_PO_Number '
      'FROM Company '
      'Where Company = 1;')
    Left = 104
    Top = 168
  end
  object qryIncLastPONum: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Company '
      'SET Last_PO_Number = :Last_PO '
      'WHERE Company = 1;')
    Left = 192
    Top = 168
    ParamData = <
      item
        Name = 'Last_PO'
      end>
  end
  object qryIncPOFileNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Supplier '
      'SET Last_PO_File = :FileNo '
      'WHERE Supplier = :Supplier;')
    Left = 280
    Top = 176
    ParamData = <
      item
        Name = 'FileNo'
      end
      item
        Name = 'Supplier'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Purch_Ord '
      'WHERE Purch_Ord_No = :PurchOrdNo')
    Left = 16
    Top = 224
    ParamData = <
      item
        Name = 'PurchOrdNo'
      end>
  end
  object qryGetPOLines2: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord_Line '
      'WHERE Purch_Ord = :PONum')
    Left = 104
    Top = 224
    ParamData = <
      item
        Name = 'PONum'
      end>
  end
  object qryGetSuppOrdTypeDesc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Supplier_Ord_Type '
      'WHERE Supplier = :Supplier and Supp_Ord_Type = :SuppOrd_Type;')
    Left = 192
    Top = 280
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'SuppOrd_Type'
      end>
  end
  object qryNewPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord '
      'WHERE Purch_Ord_Status = '#39'C'#39' and Supplier = :Supplier; ')
    Left = 16
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryGetSuppPartInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * From Part_Supplier '
      'WHERE Supplier = :Supplier AND '
      'Part = :Part')
    Left = 280
    Top = 120
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Part'
      end>
  end
  object qryDelExChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Purch_Ord_Add_Charge'
      'Where Purch_Ord = :Purch_Ord;')
    Left = 360
    Top = 112
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryInsExChg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT into Purch_Ord_Add_Charge'
      
        '(Purch_Ord, Additional_Charge, Details, Amount, Nominal, Vat_Cod' +
        'e)'
      'VALUES'
      
        '(:Purch_Ord, :Additional_Charge, :Details, :Amount, :Nominal, :V' +
        'at_Code)'
      ' ')
    Left = 448
    Top = 112
    ParamData = <
      item
        Name = 'Purch_Ord'
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
        Name = 'Nominal'
      end
      item
        Name = 'Vat_Code'
      end>
  end
  object qryGetExChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * from Purch_Ord_Add_Charge '
      'Where Purch_Ord = :Purch_Ord;')
    Left = 360
    Top = 168
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetVatRate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Vat_Code'
      'where Vat_Code = :Vat_Code;')
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'Vat_Code'
      end>
  end
  object qryGetCoDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company '
      'where company=1;')
    Left = 104
    Top = 120
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 360
    Top = 232
  end
  object qryUpd: TFDQuery
    ConnectionName = 'PB'
    Left = 424
    Top = 232
  end
  object qryUpPOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set Purch_Ord_Status = :Purch_Ord_Status'
      'Where Purch_Ord = :Purch_Ord')
    Left = 592
    Top = 72
    ParamData = <
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryCheckPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'where Part = :Part')
    Left = 592
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAddPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      '       Not_In_Use, Track_Serial_No, Last_Store_Lot,'
      
        '       Numbered, Price_Unit, Customer, Branch_No, Sales_Nominal,' +
        ' Purchase_Nominal,'
      
        '       Markup_Type, Markup_Value, Product_Class, Product_Type, U' +
        'nit_of_Measure,'
      '       Order_Part_online, Inactive_When_Balance_Zero)'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        '_Code, '#39'Y'#39','
      '       '#39'N'#39', NULL, :Purch_Pack_Quantity, :Sell_Pack_Quantity,'
      '       :Part_Purchase_Price, 0, 0,'
      '       '#39'N'#39', '#39'N'#39', '#39'LOT00000'#39','
      '       '#39'N'#39', NULL, NULL, NULL, '#39#39', '#39#39','
      '       '#39#39', 0, :Product_class, NULL, '#39#39','
      '       '#39'N'#39', '#39'N'#39')'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    Left = 592
    Top = 192
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Product_class'
      end>
  end
  object qryAddLevels: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Part_Store_Levels'
      'select top 1 :Part, '
      '          Part_Store_type,'
      '          :Stock_Levels,:Stock_Levels,'#39'P'#39',NULL,:Stock_Levels'
      'from Part_Store_type')
    Left = 592
    Top = 256
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Stock_Levels'
      end
      item
        Name = 'Stock_Levels'
      end
      item
        Name = 'Stock_Levels'
      end>
  end
  object qryGetLastSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Order_line_No) as Max_Line_No'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_Order')
    Left = 192
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryInsSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order_Line'
      
        '(Sales_Order, Sales_Order_Line_No, Part, Part_Cost, Purch_pack_q' +
        'uantity, Part_Sales_Price, Sell_Pack_Quantity,'
      
        '  Quantity_Ordered, Quantity_Allocated, Quantity_Delivered, Cont' +
        'ract,'
      '  Contract_Line_No, Sales_Order_Line_Status, Quantity_Invoiced,'
      '  Discount_Type, Discount_Value, Vat_Code, Original_Sell_Price,'
      
        '  Markup_Type, Markup_Value, Quantity_Overs, Replacement_For_Lin' +
        'e)'
      'Values'
      
        '(:Sales_Order, :Line, :Part, :Part_Cost, :Purch_pack_quantity, :' +
        'Part_Sales_Price, :Sell_Pack_Quantity,'
      
        '  :Quantity_Ordered, :Quantity_Allocated, :Quantity_Delivered, :' +
        'Contract,'
      
        '  :Contract_Line_No, :Sales_Order_Line_Status, :Quantity_Invoice' +
        'd,'
      '  :Discount_Type,'
      '  :Discount_Value,'
      '  :Vat_Code,'
      '  :Original_Sell_Price,'
      '  :Markup_Type,'
      '  :Markup_Value,'
      '  :Quantity_Overs, :Replacement_for_line)'
      ''
      '  '
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
    Left = 360
    Top = 288
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_pack_quantity'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Contract'
        DataType = ftInteger
      end
      item
        Name = 'Contract_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_Status'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Discount_Type'
        DataType = ftString
      end
      item
        Name = 'Discount_Value'
        DataType = ftFloat
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Original_Sell_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Value'
        DataType = ftFloat
      end
      item
        Name = 'Quantity_Overs'
        DataType = ftInteger
      end
      item
        Name = 'Replacement_for_line'
      end>
  end
end
