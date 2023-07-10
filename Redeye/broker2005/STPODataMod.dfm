object STPODM: TSTPODM
  OldCreateOrder = False
  Left = 209
  Top = 136
  Height = 480
  Width = 785
  object qryInsPO: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Rec_Ref'
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
        Name = 'Purch_Ord_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Part_Store_From'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Purch_Ord_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supp_Order_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPO: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Rec_Ref'
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
        Name = 'Purch_Ord_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Part_Store_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purch_Ord_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supp_Order_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Version_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Ack_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryDelPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'DELETE '
      'FROM Purch_Ord '
      'WHERE Purch_Ord = :Purch_Ord')
    Left = 280
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Purch_Ord) as Last_Code'
      'From Purch_Ord'
      ' '
      ' '
      ' ')
    Left = 16
    Top = 168
  end
  object qryInsPOLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Ordered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_Deliv_Expected'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRN_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Replacement_For_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Cost_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Purch_Pack_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Is_Sample'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPOLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Ordered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_Deliv_Expected'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRN_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Replacement_For_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'Cost_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Purch_Pack_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Is_Sample'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLines: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryDelPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line.Purch_Ord_Line_no = :Purch_Ord_Line_no)'
      ' ')
    Left = 280
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryDelPOLines: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) '
      ' '
      ' ')
    Left = 360
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastPOLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryGetPartDet: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Part'
      'Where (Part = :Part)')
    Left = 16
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOTypeDesc: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord_Type '
      'WHERE Purch_Ord_Type = :PO_Type;')
    Left = 16
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PO_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetSupplierInfo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Supplier '
      'WHERE Supplier = :Supplier;')
    Left = 192
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryLastCompnyPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Last_PO_Number '
      'FROM Company '
      'Where Company = 1;')
    Left = 104
    Top = 168
  end
  object qryIncLastPONum: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Company '
      'SET Last_PO_Number = :Last_PO '
      'WHERE Company = 1;')
    Left = 192
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_PO'
        ParamType = ptUnknown
      end>
  end
  object qryIncPOFileNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Supplier '
      'SET Last_PO_File = :FileNo '
      'WHERE Supplier = :Supplier;')
    Left = 280
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FileNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryGetPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Purch_Ord '
      'WHERE Purch_Ord_No = :PurchOrdNo')
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PurchOrdNo'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLines2: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord_Line '
      'WHERE Purch_Ord = :PONum')
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PONum'
        ParamType = ptUnknown
      end>
  end
  object qryGetSuppOrdTypeDesc: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Supplier_Ord_Type '
      'WHERE Supplier = :Supplier and Supp_Ord_Type = :SuppOrd_Type;')
    Left = 192
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SuppOrd_Type'
        ParamType = ptUnknown
      end>
  end
  object qryNewPOs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Purch_Ord '
      'WHERE Purch_Ord_Status = '#39'C'#39' and Supplier = :Supplier; ')
    Left = 16
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryGetSuppPartInfo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * From Part_Supplier '
      'WHERE Supplier = :Supplier AND '
      'Part = :Part')
    Left = 280
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryDelExChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete from Purch_Ord_Add_Charge'
      'Where Purch_Ord = :Purch_Ord;')
    Left = 360
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryInsExChg: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end>
  end
  object qryGetExChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * from Purch_Ord_Add_Charge '
      'Where Purch_Ord = :Purch_Ord;')
    Left = 360
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryGetVatRate: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Vat_Code'
      'where Vat_Code = :Vat_Code;')
    Left = 360
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end>
  end
  object qryGetCoDtls: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from company '
      'where company=1;')
    Left = 104
    Top = 120
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 360
    Top = 232
  end
  object qryUpd: TQuery
    DatabaseName = 'PB'
    Left = 424
    Top = 232
  end
  object qryUpPOStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set Purch_Ord_Status = :Purch_Ord_Status'
      'Where Purch_Ord = :Purch_Ord')
    Left = 592
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryCheckPart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'where Part = :Part')
    Left = 592
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryAddPart: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_class'
        ParamType = ptUnknown
      end>
  end
  object qryAddLevels: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Levels'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Levels'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Levels'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastSOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Sales_Order_line_No) as Max_Line_No'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_Order')
    Left = 192
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryInsSOLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_pack_quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Sales_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Ordered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Discount_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'Original_Sell_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Markup_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Markup_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Overs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Replacement_for_line'
        ParamType = ptUnknown
      end>
  end
end
