object dtmdlPurchaseOrder: TdtmdlPurchaseOrder
  Height = 565
  Width = 1024
  object qryAllPurchases: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Descriptive_Reference,'
      '        Supplier.Supplier_Name,'
      '        Purchase_Order.Date_Raised,'
      '        Purchase_Order.Date_Required,'
      '        Purchase_Order.Operator,'
      '        Purchase_Order.Reference,'
      '        Purchase_Order.On_Hold,'
      '        Purchase_Order.inactive,'
      '        Purchase_Order.Goods_Value,'
      '        Operator.Operator_Name,'
      '        Purchase_Order.Goods_Receipt_Number,'
      '        Purchase_Order.Purchase_Order_Status,'
      '        Purchase_Order_Status.Status_Description,'
      '        Purchase_Order.Cut_Off_Date,'
      '        Purchase_Order.Contact_No,'
      '        Supplier_contact.Contact_name,'
      '        Purchase_Order.Notes,'
      '        Office_Contact.Operator_Name AS Office_Contact_Name'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Supplier_contact'
      '      INNER JOIN (Purchase_Order_Status'
      '      INNER JOIN Purchase_Order'
      
        '          ON Purchase_Order_Status.Purchase_Order_Status = Purch' +
        'ase_Order.Purchase_Order_Status)'
      
        '          ON (Supplier_contact.Contact_no = Purchase_Order.Conta' +
        'ct_No) AND (Supplier_contact.Supplier = Purchase_Order.Supplier)' +
        ')'
      '          ON Operator.Operator = Purchase_Order.Operator)'
      '          ON Supplier.Supplier = Supplier_contact.Supplier)'
      
        '          ON Office_Contact.Operator = Purchase_Order.Office_Con' +
        'tact'
      'WHERE (1=1)')
    Left = 32
    Top = 24
    object qryAllPurchasesPurchase_Order: TIntegerField
      FieldName = 'Purchase_Order'
    end
    object qryAllPurchasesSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryAllPurchasesDescriptive_Reference: TStringField
      FieldName = 'Descriptive_Reference'
      Size = 255
    end
    object qryAllPurchasesSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      Size = 50
    end
    object qryAllPurchasesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryAllPurchasesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryAllPurchasesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryAllPurchasesReference: TStringField
      FieldName = 'Reference'
      Size = 50
    end
    object qryAllPurchasesOn_Hold: TStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qryAllPurchasesinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object qryAllPurchasesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      DisplayFormat = '0.00'
    end
    object qryAllPurchasesOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qryAllPurchasesGoods_Receipt_Number: TStringField
      FieldName = 'Goods_Receipt_Number'
      Size = 10
    end
    object qryAllPurchasesPurchase_Order_Status: TIntegerField
      FieldName = 'Purchase_Order_Status'
    end
    object qryAllPurchasesStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 50
    end
    object qryAllPurchasesCut_Off_Date: TDateTimeField
      FieldName = 'Cut_Off_Date'
    end
    object qryAllPurchasesContact_No: TIntegerField
      FieldName = 'Contact_No'
    end
    object qryAllPurchasesContact_name: TStringField
      FieldName = 'Contact_name'
      Size = 30
    end
    object qryAllPurchasesOffice_Contact_Name: TStringField
      FieldName = 'Office_Contact_Name'
      Size = 30
    end
  end
  object dtsAllPurchases: TDataSource
    DataSet = qryAllPurchases
    Left = 128
    Top = 24
  end
  object qryPOHeader: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Descriptive_Reference,'
      '        Purchase_Order.Reference,'
      '        Supplier.Supplier_Name,'
      '        Purchase_Order.Date_Raised,'
      '        Purchase_Order.Date_Required,'
      '        Purchase_Order.Operator,'
      '        Operator.Operator_Name,'
      '        Purchase_Order.Goods_Receipt_Number,'
      '        Purchase_Order.Purchase_Order_Status,'
      '        Purchase_Order_Status.Status_Description,'
      '        Purchase_Order.Cut_Off_Date,'
      '        Purchase_Order.Contact_No,'
      '        Supplier_contact.Contact_name,'
      '        Purchase_Order.Notes,'
      '        Purchase_Order.On_Hold,'
      '        Purchase_Order.inactive,'
      '        Purchase_Order.inactive_reason,'
      '        Purchase_Order.Office_Contact,'
      '        Purchase_Order.Delivery_Address,'
      '        Office_Contact.Operator_Name as Account_Manager_Name'
      'FROM Operator AS Office_Contact'
      '        INNER JOIN (Supplier'
      '        INNER JOIN (Operator'
      '        INNER JOIN (Supplier_contact'
      '        INNER JOIN (Purchase_Order_Status'
      '        INNER JOIN Purchase_Order'
      
        '          ON Purchase_Order_Status.Purchase_Order_Status = Purch' +
        'ase_Order.Purchase_Order_Status)'
      
        '          ON (Supplier_contact.Contact_no = Purchase_Order.Conta' +
        'ct_No) AND (Supplier_contact.Supplier = Purchase_Order.Supplier)' +
        ')'
      '          ON Operator.Operator = Purchase_Order.Operator)'
      '          ON Supplier.Supplier = Supplier_contact.Supplier)'
      
        '          ON Office_Contact.Operator = Purchase_Order.Office_Con' +
        'tact'
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 32
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator')
    Left = 528
    Top = 24
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 584
    Top = 24
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 248
    Top = 24
  end
  object qryGetSupplier: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Street,'
      '        Locale,'
      '        Town_City,'
      '        Postcode,'
      '        County_State,'
      '        Telephone_number,'
      '        Fax_number,'
      '        web_address'
      'from Supplier where Supplier = :Supplier')
    Left = 528
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryPOAddHeader: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert INTO Purchase_Order'
      '(       Purchase_Order,'
      '        Supplier,'
      '        Date_Raised,'
      '        Date_Required,'
      '        Operator,'
      '        Goods_Receipt_Number,'
      '        Purchase_Order_Status,'
      '        Cut_Off_Date,'
      '        Contact_No,'
      '        Notes,'
      '        Office_Contact,'
      '        Reference,'
      '        Inactive,'
      '        Inactive_Reason,'
      '        Goods_Value,'
      '        VAT_Value,'
      '        On_Hold,'
      '        Descriptive_Reference'
      ')'
      'Values'
      '(       :Purchase_Order,'
      '        :Supplier,'
      '        :Date_Raised,'
      '        :Date_Required,'
      '        :Operator,'
      '        :Goods_Receipt_Number,'
      '        :Purchase_Order_Status,'
      '        :Cut_Off_Date,'
      '        :Contact_No,'
      '        :Notes,'
      '        :Office_Contact,'
      '        :Reference,'
      '        :Inactive,'
      '        :Inactive_Reason,'
      '        :Goods_Value,'
      '        :VAT_Value,'
      '        :On_Hold,'
      '        :Descriptive_Reference'
      ')')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Raised'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Goods_Receipt_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Cut_Off_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Goods_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VAT_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end>
  end
  object qryPOUpHeader: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Purchase_Order'
      'Set     Supplier = :Supplier,'
      '        Date_Raised = :Date_Raised,'
      '        Date_Required = :Date_Required,'
      '        Operator = :Operator,'
      '        Goods_Receipt_Number = :Goods_Receipt_Number,'
      '        Purchase_Order_Status = :Purchase_Order_Status,'
      '        Cut_Off_Date = :Cut_Off_Date,'
      '        Contact_No = :Contact_no,'
      '        Notes = :Notes,'
      '        Office_Contact = :Office_Contact,'
      '        Reference = :Reference,'
      '        Inactive = :Inactive,'
      '        Inactive_Reason = :Inactive_Reason,'
      '        Goods_Value = :Goods_Value,'
      '        VAT_Value = :Vat_Value,'
      '        On_Hold = :On_Hold,'
      '        Descriptive_Reference = :Descriptive_Reference'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Raised'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Receipt_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Cut_Off_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryPOGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Last_Purchase_Order_number'
      'from Company'
      'where company = 1')
    Left = 312
    Top = 24
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'update company'
      'set last_purchase_order_number = :last_purchase_order_number'
      'where company = 1')
    Left = 392
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'last_purchase_order_number'
        ParamType = ptUnknown
      end>
  end
  object qryPOUpStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Purchase_order'
      'set Purchase_order_status = :Purchase_order_Status'
      'where Purchase_order = :Purchase_order')
    Left = 32
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end>
  end
  object qryVAT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from VAt'
      'order by Vat_Rate')
    Left = 528
    Top = 152
    object qryVATVat: TIntegerField
      FieldName = 'Vat'

    end
    object qryVATVat_Rate: TFloatField
      FieldName = 'Vat_Rate'

      DisplayFormat = '0.00'
    end
    object qryVATDescription: TStringField
      FieldName = 'Description'

      Size = 40
    end
    object qryVATVat_Code: TStringField
      FieldName = 'Vat_Code'

      Size = 1
    end
  end
  object dtsVAT: TDataSource
    DataSet = qryVAT
    Left = 576
    Top = 152
  end
  object qryGetContacts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Supplier_Contact.Contact_No,'
      '        Supplier_Contact.Contact_Name'
      'FROM Supplier_Contact'
      'WHERE Supplier = :Supplier AND '
      '((inactive = '#39'N'#39') OR (inactive IS NULL))')
    Left = 528
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 760
    Top = 24
  end
  object qryMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Material_Type.*'
      'from Material_Type'
      'where (inactive = '#39'N'#39' or inactive is null) '
      'order by Description')
    Left = 704
    Top = 24
  end
  object qryWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '  worktop_thickness.thickness,'
      '  Thickness.Thickness_mm'
      'from worktop_thickness, thickness'
      'where (worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness)'
      'order by thickness_mm')
    Left = 704
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 760
    Top = 80
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 760
    Top = 144
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from worktop'
      'where material_type = :material_type and'
      
        '(worktop.inactive = '#39'N'#39' or worktop.inactive is null) OR worktop ' +
        '= :worktop'
      'Order by Description')
    Left = 704
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object qryPOAllLines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Purchase_orderline.Purchase_Order,'
      '        Purchase_orderline.Line_no,'
      '        Purchase_orderline.Stock_item,'
      '        Stock_item.Stock_Description,'
      '        Purchase_orderline.Depth,'
      '        Purchase_orderline.Length,'
      '        Purchase_orderline.Description,'
      '        Purchase_orderline.Unit_cost,'
      '        Purchase_orderline.Price_unit,'
      '        Purchase_orderline.Quantity,'
      '        Purchase_orderline.Date_Required,'
      '        Purchase_orderline.Date_Received,'
      '        Purchase_orderline.Product,'
      '        Product.Product_Description,'
      '        Product.Product_code,'
      '        Purchase_orderline.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Purchase_orderline.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Purchase_orderline.Quantity_Delivered,'
      '        Purchase_orderline.Quantity_Invoiced,'
      '        Purchase_orderline.Discount_Percentage,'
      '        Purchase_orderline.Notes,'
      '        Purchase_orderline.Supplier_Product_Code,'
      '        Purchase_orderline.Sales_Order,'
      '        Purchase_orderline.Sales_Order_Line_no,'
      '        Purchase_orderline.Slab_Depth,'
      '        Purchase_orderline.Slab_Length,'
      '        Purchase_orderline.Slab_Description,'
      '        Purchase_orderline.Slab_Unit_Cost,'
      '        Purchase_orderline.Cost_Pack_Quantity,'
      '        Purchase_orderline.GRN_Number,'
      '        Purchase_orderline.DEL_Number,'
      '        Purchase_orderLine.Vat,'
      '        Vat.Vat_Rate'
      'FROM Stock_item'
      '      RIGHT JOIN (Worktop'
      '      RIGHT JOIN (Vat'
      '      RIGHT JOIN (Thickness'
      '      RIGHT JOIN (Sales_Order_Line'
      '      RIGHT JOIN (Purchase_orderline'
      '      LEFT JOIN Product'
      '          ON Purchase_orderline.Product = Product.Product)'
      
        '          ON (Sales_Order_Line.Sales_order_Line_no = Purchase_or' +
        'derline.Sales_Order_Line_No) AND (Sales_Order_Line.Sales_Order =' +
        ' Purchase_orderline.Sales_Order))'
      '          ON Thickness.Thickness = Purchase_orderline.Thickness)'
      '          ON Vat.Vat = Purchase_orderline.Vat)'
      '          ON Worktop.Worktop = Purchase_orderline.Worktop)'
      
        '          ON Stock_item.Stock_item = Purchase_orderline.Stock_it' +
        'em'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_Order')
    Left = 120
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryMaterialSlab: TFDQuery
    ConnectionName = 'wt'
    MasterSource = dtsMaterial
    SQL.Strings = (
      'SELECT Material_Type_Slab_Size.Slab_Size,'
      '       Material_Type_Slab_Size.Length,'
      '       Material_Type_Slab_Size.Depth,'
      '       Material_Type_Slab_Size.Slab_Size_Description,'
      
        '       CSTR(Material_Type_Slab_Size.Length) + '#39' x '#39' + CSTR(Mater' +
        'ial_Type_Slab_Size.Depth) + '#39' '#39' + Material_Type_Slab_Size.Slab_S' +
        'ize_Description as Slab_Description'
      'FROM Material_Type_Slab_Size'
      'WHERE Material_Type = :Material_Type'
      'ORDER BY Length')
    Left = 704
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object dtsMaterialSlab: TDataSource
    DataSet = qryMaterialSlab
    Left = 768
    Top = 208
  end
  object qryOneWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Supplier,'
      '        Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Supplier_Worktop_thickness'
      'where Supplier = :Supplier AND'
      '      Worktop = :Worktop and'
      '      Thickness = :Thickness')
    Left = 880
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryPOAddLine: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLine'
      '('
      'Purchase_Order,'
      'Line_no,'
      'Stock_Item,'
      'Unit_Cost,'
      'Price_Unit,'
      'Quantity,'
      'Date_Received,'
      'Date_Required,'
      'Worktop,'
      'Thickness,'
      'Quantity_Delivered,'
      'Quantity_Invoiced,'
      'Description,'
      'Discount_Percentage,'
      'Notes,'
      'Supplier_Product_Code,'
      'Sales_Order,'
      'Sales_Order_Line_no,'
      'Slab_Depth,'
      'Slab_Length,'
      'Slab_Unit_Cost,'
      'Slab_Description,'
      'Vat,'
      'Cost_Pack_Quantity,'
      'GRN_Number,'
      'DEL_Number'
      ')'
      'VALUES'
      '('
      ':Purchase_Order,'
      ':Line_no,'
      ':Stock_Item,'
      ':Unit_Cost,'
      ':Price_Unit,'
      ':Quantity,'
      ':Date_Received,'
      ':Date_Required,'
      ':Worktop,'
      ':Thickness,'
      ':Quantity_Delivered,'
      ':Quantity_Invoiced,'
      ':Description,'
      ':Discount_Percentage,'
      ':Notes,'
      ':Supplier_Product_Code,'
      ':Sales_Order,'
      ':Sales_Order_Line_no,'
      ':Slab_Depth,'
      ':Slab_Length,'
      ':Slab_Unit_Cost,'
      ':Slab_Description,'
      ':Vat,'
      ':Cost_Pack_Quantity,'
      ':GRN_Number,'
      ':DEL_Number'
      ')')
    Left = 32
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRN_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEL_NUmber'
        ParamType = ptUnknown
      end>
  end
  object qryPOUpdLine: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_OrderLine'
      'SET'
      '  Stock_Item = :Stock_Item,'
      '  Unit_Cost = :Unit_Cost,'
      '  Price_Unit = :Price_unit,'
      '  Quantity = :Quantity,'
      '  Date_Received = :Date_Received,'
      '  Date_Required = :Date_Required,'
      '  Description = :Description,'
      '  Worktop = :Worktop,'
      '  Thickness = :Thickness,'
      '  Quantity_Delivered = :Quantity_Delivered,'
      '  Quantity_Invoiced = :Quantity_Invoiced,'
      '  Discount_Percentage = :Discount_Percentage,'
      '  Notes = :Notes,'
      '  Supplier_Product_Code = :Supplier_Product_Code,'
      '  Sales_Order = :Sales_Order,'
      '  Sales_Order_Line_no = :Sales_Order_line_no,'
      '  Slab_Depth = :Slab_Depth,'
      '  Slab_Length = :Slab_Length,'
      '  Slab_Unit_Cost = :Slab_Unit_Cost,'
      '  Slab_Description = :Slab_Description,'
      '  Vat = :Vat,'
      '  Cost_Pack_Quantity = :Cost_Pack_Quantity,'
      '  GRN_Number = :GRN_Number,'
      '  DEL_Number = :DEL_Number'
      'WHERE Purchase_Order = :Purchase_Order AND'
      '      Line_no = :Line_no'
      '')
    Left = 32
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRN_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEL_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryQHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Quote.Date_Required,'
      '        Quote.Date_Raised,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Description,'
      '        Quote.Account_Manager,'
      '        Material_Type.Preferred_Supplier as Supplier,'
      '        Supplier.Supplier_Name'
      'FROM Supplier'
      '    RIGHT JOIN (Operator'
      '    INNER JOIN (Material_Type'
      '    INNER JOIN Quote'
      '      ON Material_Type.Material_Type = Quote.Material_Type)'
      '      ON Operator.Operator = Quote.Operator)'
      '      ON Supplier.Supplier = Material_Type.Preferred_Supplier'
      'WHERE Quote.Quote = :Quote')
    Left = 32
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetSupplierContact: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Supplier_Contact.Contact_No,'
      '        Supplier_Contact.Contact_Name'
      'FROM Supplier_Contact'
      'WHERE Supplier = :Supplier AND '
      '((inactive = '#39'N'#39') OR (inactive IS NULL))')
    Left = 528
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryQSlab: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  DISTINCT'
      '        Quote_Slab.Quote,'
      '        Quote.Customer_Name,'
      '        Quote.Account_Manager,'
      '        Supplier.Supplier,'
      '        Supplier.Supplier_name'
      'FROM Supplier'
      '      INNER JOIN (Quote'
      '      INNER JOIN Quote_Slab'
      '        ON Quote.Quote = Quote_Slab.Quote)'
      '        ON Supplier.Supplier = Quote_Slab.Supplier'
      
        'WHERE Quote_Slab.Quote = :Quote AND Quote_Slab.Supplier = :Suppl' +
        'ier')
    Left = 32
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteLines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '  Quote_Element.Quote,'
      '  Quote_Element.Material_type,'
      '  Material_Type.Description as Material_Description,'
      '  Quote_Element.Worktop,'
      '  Worktop.Description as Worktop_Description,'
      '  Quote_Element.Thickness,'
      '  Thickness.Thickness_mm,'
      '  (SUM(Depth*Length*Quantity)/1000000) as Material_Area'
      'FROM Thickness'
      '  INNER JOIN ((Material_Type'
      '  INNER JOIN (Worktop_thickness'
      '  INNER JOIN Quote_Element'
      
        '    ON (Worktop_thickness.Thickness = Quote_Element.Thickness) A' +
        'ND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      
        '    ON Material_Type.Material_Type = Quote_Element.Material_type' +
        ')'
      '  INNER JOIN Worktop'
      
        '    ON (Worktop.Worktop = Worktop_thickness.Worktop) AND (Materi' +
        'al_Type.Material_Type = Worktop.Material_Type))'
      '    ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote_Element.Quote = :Quote'
      'GROUP BY Quote_Element.Quote,'
      '  Quote_Element.Material_type,'
      '  Material_Type.Description,'
      '  Quote_Element.Worktop,'
      '  Worktop.Description,'
      '  Quote_Element.Thickness,'
      '  Thickness.Thickness_mm')
    Left = 112
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qrySupplierWorktopCost: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Supplier,'
      '        Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_Thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_Thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Supplier_Worktop_Thickness'
      'where supplier = :supplier and'
      'worktop = :Worktop and'
      'thickness = :Thickness')
    Left = 528
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryMaterialSlabs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Slab_Size_Description,'
      '        Depth,'
      '        Length'
      'From Material_Type_Slab_Size'
      'Where Material_Type = :Material_Type'
      'Order By Length')
    Left = 528
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteSlabs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Quote_Slab.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Price_Unit,'
      '        Quote_Slab.Quantity,'
      '        Worktop.Material_Type,'
      '        Material_Type.Description as Material_Description'
      'FROM (Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN Worktop_thickness'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '      INNER JOIN Quote_Slab'
      
        '        ON (Worktop_thickness.Thickness = Quote_Slab.Thickness) ' +
        'AND (Worktop_thickness.Worktop = Quote_Slab.Worktop)'
      
        'WHERE Quote_Slab.Quote = :Quote AND Quote_Slab.Supplier = :Suppl' +
        'ier')
    Left = 112
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOStatus: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_Order'
      'SET Purchase_Order_Status = :Purchase_Order_Status'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 200
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOLines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_OrderLine'
      'SET Quantity_Delivered = (Quantity * :Multiplier)'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 288
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Multiplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetProducts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Supplier_Product_Code, Description'
      'FROM Supplier_Product'
      'WHERE Supplier = :Supplier AND (Inactive = '#39'N'#39')'
      'ORDER BY Supplier_Product_Code')
    Left = 720
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object dtsGetProducts: TDataSource
    DataSet = qryGetProducts
    Left = 792
    Top = 408
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Description,'
      '    Supplier_Product.Cost_Pack_Quantity,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost'
      'FROM Supplier_Product'
      'WHERE (Supplier = :Supplier) AND'
      '      (Supplier_Product_Code = :Supplier_Product_Code) AND'
      '      (Inactive = '#39'N'#39')')
    Left = 720
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Descriptive_Reference,'
      '        Supplier.Supplier_Name,'
      '        Purchase_Order.Date_Raised,'
      '        Purchase_Order.Date_Required,'
      '        Purchase_Order.Operator,'
      '        Purchase_Order.Reference,'
      '        Purchase_Order.On_Hold,'
      '        Purchase_Order.inactive,'
      '        Purchase_Order.Goods_Value,'
      '        Operator.Operator_Name,'
      '        Purchase_Order.Goods_Receipt_Number,'
      '        Purchase_Order.Purchase_Order_Status,'
      '        Purchase_Order_Status.Status_Description,'
      '        Purchase_Order.Cut_Off_Date,'
      '        Purchase_Order.Contact_No,'
      '        Supplier_contact.Contact_name,'
      '        Office_Contact.Operator_Name AS Office_Contact_Name'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Supplier_contact'
      '      INNER JOIN (Purchase_Order_Status'
      '      INNER JOIN Purchase_Order'
      
        '          ON Purchase_Order_Status.Purchase_Order_Status = Purch' +
        'ase_Order.Purchase_Order_Status)'
      
        '          ON (Supplier_contact.Contact_no = Purchase_Order.Conta' +
        'ct_No) AND (Supplier_contact.Supplier = Purchase_Order.Supplier)' +
        ')'
      '          ON Operator.Operator = Purchase_Order.Operator)'
      '          ON Supplier.Supplier = Supplier_contact.Supplier)'
      
        '          ON Office_Contact.Operator = Purchase_Order.Office_Con' +
        'tact'
      'WHERE (1=1)')
    Left = 200
    Top = 24
  end
  object qryGetSOLines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Supplier,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Quantity,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description,'
      '        Quote_Slab.Price_Unit,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Customer_Name,'
      
        '        Thickness.Thickness_mm + '#39'mm '#39' + Worktop.Description + '#39 +
        ' '#39' + Material_Type.Description as Slab_Description,'
      '        (Select SUM(Quantity)'
      '         FROM Purchase_OrderLine'
      
        '         WHERE Purchase_OrderLine.Sales_Order = Sales_Order_Line' +
        '.Sales_Order AND'
      
        '               Purchase_OrderLine.Sales_Order_Line_No = Sales_Or' +
        'der_Line.Sales_order_Line_no AND'
      
        '               Purchase_OrderLine.Worktop <> 0) as Total_Slabs_O' +
        'rdered'
      'FROM Sales_Order'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Quote_Slab'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der'
      'WHERE ('
      '      (Quote_Slab.Supplier = :Supplier) AND'
      
        '      ((Sales_Order.Date_Required > 0) AND (Sales_Order.Date_Req' +
        'uired <= :Date_Required)) AND'
      '      (Sales_Order.Sales_order_Status < 50) AND'
      '      (Sales_Order.Customer_Name LIKE :Customer_Name)  AND'
      '      ((Select SUM(Quantity)'
      '         FROM Purchase_OrderLine'
      
        '         WHERE Purchase_OrderLine.Sales_Order = Sales_Order_Line' +
        '.Sales_Order AND'
      
        '               Purchase_OrderLine.Sales_Order_Line_No = Sales_Or' +
        'der_Line.Sales_order_Line_no AND'
      '               Purchase_OrderLine.Worktop <> 0) IS NULL) OR'
      '      (Sales_Order.Sales_order = :Sales_Order)'
      '      )'
      'ORDER BY Sales_Order_Line.Sales_Order DESC')
    Left = 200
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsGetSOLines: TDataSource
    DataSet = qryGetSOLines
    Left = 128
    Top = 80
  end
  object qryQuoteSlab: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Quote_Slab.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Price_Unit,'
      '        Quote_Slab.Quantity,'
      '        Worktop.Material_Type,'
      '        Material_Type.Description as Material_Description'
      'FROM (Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN Worktop_thickness'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '      INNER JOIN Quote_Slab'
      
        '        ON (Worktop_thickness.Thickness = Quote_Slab.Thickness) ' +
        'AND (Worktop_thickness.Worktop = Quote_Slab.Worktop)'
      
        'WHERE quote_Slab.Quote = :Quote and Quote_Slab.Slab_Number = :Sl' +
        'ab_Number')
    Left = 200
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Number'
        ParamType = ptUnknown
      end>
  end
  object qryDummy_old: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Supplier,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Quantity,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description,'
      '        Quote_Slab.Price_Unit,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Customer_Name,'
      
        '        Thickness.Thickness_mm + '#39'mm '#39' + Worktop.Description + '#39 +
        ' '#39' + Material_Type.Description as Slab_Description'
      'FROM Sales_Order'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Quote_Slab'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der'
      'WHERE ((Quote_Slab.Supplier = :Supplier) AND'
      
        '      ((Sales_Order.Date_Required > 0) AND (Sales_Order.Date_Req' +
        'uired <= :Date_Required)) AND'
      '      (Sales_Order.Sales_order_Status < 60)) AND'
      
        '      ((Sales_Order.Sales_order = :Sales_Order) OR (:Sales_Order' +
        ' = 0)) and'
      '      (Sales_Order.Customer_Name LIKE :Customer_Name)'
      'ORDER BY Sales_Order_Line.Sales_Order DESC')
    Left = 272
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
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
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select count(Purchase_Order) as total_lines,'
      '(select sum(quantity)'
      ' from Purchase_Orderline POL'
      
        ' where POL.Purchase_Order = :Purchase_Order) as total_Qty_to_Ord' +
        'er,'
      '(select sum(quantity_invoiced)'
      ' from Purchase_OrderLine POL'
      
        ' where POL.Purchase_Order = :Purchase_Order) as total_PO_Invoice' +
        'd,'
      '(select sum(quantity_Delivered)'
      ' from Purchase_Orderline POL'
      ' where POL.Purchase_Order = :Purchase_Order) as total_Delivered'
      'from Purchase_OrderLine'
      'where Purchase_OrderLine.Purchase_Order = :Purchase_Order')
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOStatus: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Sales_Order_Status,'
      '(select sum(QS.quantity)'
      ' from sales_order_line SOL, Quote_Slab QS'
      ' where SOL.Sales_Order = :sales_order AND'
      ' (QS.Quote = SOL.Quote)) as total_Qty_to_Purchase,'
      '(select sum(quantity)'
      ' from Purchase_Orderline, Purchase_Order'
      ' where Purchase_Orderline.Sales_Order = :Sales_order AND'
      
        '       (Purchase_Orderline.Purchase_Order = Purchase_Order.Purch' +
        'ase_Order) AND'
      
        '       ((Purchase_Order.inactive IS NULL) OR (Purchase_Order.ina' +
        'ctive = '#39'N'#39'))) as total_Purchased'
      'From Sales_Order'
      'WHERE Sales_Order = :Sales_Order')
    Left = 528
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Status = :Sales_Order_Status'
      'WHERE Sales_Order = :Sales_Order')
    Left = 608
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteAdhesives: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Quote_Slab.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Adhesive_Unit_Cost,'
      '        Quote_Slab.Adhesive_Cost_Pack_Quantity,'
      '        Quote_Slab.Adhesive_Product_Code,'
      '        Quote_Slab.Adhesive_Quantity,'
      '        Worktop.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Supplier_Product.Supplier_Product_Code,'
      
        '        Supplier_Product.Description as Supplier_Product_Descrip' +
        'tion'
      'FROM ((Material_Type'
      '      INNER JOIN Worktop'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN Quote_Slab'
      '        ON (Worktop_thickness.Worktop = Quote_Slab.Worktop)'
      
        '          AND (Worktop_thickness.Thickness = Quote_Slab.Thicknes' +
        's))'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '      LEFT JOIN Supplier_Product'
      
        '        ON (Quote_Slab.Adhesive_Product_Code = Supplier_Product.' +
        'Supplier_Product_Code)'
      '          AND (Quote_Slab.Supplier = Supplier_Product.Supplier)'
      
        'WHERE quote_Slab.Quote = :Quote AND quote_Slab.Supplier = :Suppl' +
        'ier AND quote_Slab.Adhesive_Product_Code <> '#39#39)
    Left = 288
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryPOAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *, Operator.Operator_Name'
      'from Purchase_Order_internal_Note, Operator'
      'where Purchase_Order = :Purchase_Order and'
      'Purchase_Order_internal_Note.Operator = Operator.Operator')
    Left = 208
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryPOEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Purchase_Order_internal_Note, Operator'
      
        'where Purchase_Order = :Purchase_Order and Internal_Note = :Inte' +
        'rnal_Note and'
      'Purchase_Order_internal_Note.Operator = Operator.Operator')
    Left = 272
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Note'
        ParamType = ptUnknown
      end>
  end
  object qryPOAddEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Purchase_Order_Internal_Note ('
      'Purchase_Order,'
      'Internal_Note,'
      'Date_Time_Entered,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Purchase_Order,'
      ':Internal_Note,'
      ':Date_Time_Entered,'
      ':Operator,'
      ':Narrative)')
    Left = 272
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Note'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Time_Entered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
end
