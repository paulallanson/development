object dtmdlSuppliers: TdtmdlSuppliers
  OldCreateOrder = False
  Left = 302
  Top = 110
  Height = 613
  Width = 696
  object qrySuppliers: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select  Supplier.Supplier,'
      '        Supplier.Name,'
      '        Supplier_Branch.Narrative,'
      '        Supplier_Branch.Account_Code,'
      '        Supplier_Branch.Fax_Number,'
      '        Supplier_Branch.Branch_No,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Building_no_name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Postcode,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Email,'
      '        Supplier.Acc_Active,'
      '        Supplier.Courier,'
      '        (SELECT top 1 Purchase_order.Date_Point'
      #9'        FROM Purchase_Order'
      #9'        WHERE (Purchase_order.Supplier = Supplier.Supplier)'
      
        #9#9'      ORDER BY Purchase_order.Purchase_order desc) as Last_Ord' +
        'er_Date'
      'From Supplier, Supplier_Branch'
      'Where '
      '      ('
      '      (Supplier.Name Like :Code_From) or'
      '      (Supplier_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Branch_No = 0) and'
      '      ((Acc_Active = '#39'Y'#39') or (:Active_Only = '#39'N'#39'))'
      'Order By Supplier.Name')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Active_Only'
        ParamType = ptUnknown
      end>
  end
  object dtsSuppliers: TDataSource
    DataSet = qrySuppliers
    Left = 80
    Top = 16
  end
  object qryZero: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier'
      'Set     Name = :Name,'
      '        Acc_Active = :Acc_Active,'
      '        Discount = :Discount,'
      '        Intrastat_Id = :Intrastat_Id,'
      '        Currency_Code_def = :Currency_Code,'
      '        VAT_Reference = :VAT_Reference,'
      '        VAT_Code_Def = :VAT_Code_Def'
      'Where'
      '(Supplier = :Supplier) '
      '')
    Left = 88
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Intrastat_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'VAT_Code_Def'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object CurrSRC: TDataSource
    DataSet = GetCurrSQL
    Left = 24
    Top = 64
  end
  object GetLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Supplier'
      'From Supplier'
      'Where Name = :GUID')
    Left = 248
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object DelSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Supplier'
      'Where'
      '(Supplier = :Supplier)')
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object GetIntrastatSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Intrastat_Id, Intrastat_Id_Descr'
      'from Intrastat_Id'
      'Order By Intrastat_Id')
    Left = 512
    Top = 76
  end
  object AddSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Supplier(Supplier,Name,Supplier_ID)'
      
        'Select Max(Supplier)+1, :GUID, ISNULL(Max(Supplier_ID)+1,1) From' +
        ' Supplier'
      '')
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object AddBranchSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Supplier_Branch'
      '(Supplier,Branch_No,Name,Building_No_Name,Street,'
      'Locale,PostCode,Town,Phone)'
      'Values(:Supplier,0,'#39'Head Office'#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39')'
      ' ')
    Left = 392
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptInput
      end>
  end
  object CountrySRC: TDataSource
    DataSet = GetCountrySQL
    Left = 272
    Top = 92
  end
  object GetCompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Company')
    Left = 232
    Top = 68
  end
  object IntrastatSRC: TDataSource
    DataSet = GetIntrastatSQL
    Left = 576
    Top = 76
  end
  object GetCountrySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Country_Id, Country_Id_Descr'
      'from Country_Id'
      'Order By Country_Id_Descr')
    Left = 184
    Top = 92
  end
  object UpdBranchSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier_Branch'
      'Set'
      '        Building_No_Name  = :Building_No_Name,'
      '        Street = :Street,'
      '        Locale = :Locale,'
      '        PostCode = :PostCode,'
      '        Town = :Town,'
      '        Phone = :Phone,'
      '        Fax_Number = :Fax_Number,'
      '        EMail = :EMail,'
      '        Narrative = :Narrative,'
      '        Account_Code = :Account_Code,'
      '        Account_Code_on_Ledger = '#39'Y'#39
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = 0)')
    Left = 32
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Building_No_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Street'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Locale'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PostCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object UpdNotesOnlySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier_Branch'
      'Set     Narrative = :Narrative'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = 0)'
      ' '
      ' ')
    Left = 32
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object CheckCustAccExistsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Customer.Name'
      'From Customer, Customer_Branch'
      'Where (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Account_Code = :Acc_Code)')
    Left = 104
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Acc_Code'
        ParamType = ptUnknown
      end>
  end
  object DelBranchSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Supplier_Branch'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = 0)')
    Left = 264
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object CheckSuppAccExistsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Supplier.Name'
      'From Supplier, Supplier_Branch'
      'Where (Supplier.Supplier <> :Supplier) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Account_Code = :Acc_Code)')
    Left = 376
    Top = 164
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Acc_Code'
        ParamType = ptUnknown
      end>
  end
  object VATSRC: TDataSource
    DataSet = GetVATSQL
    Left = 296
    Top = 252
  end
  object UpdSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier'
      'Set     Name = :Name,'
      '        Acc_Active = :Acc_Active,'
      '        Discount = :Discount,'
      '        Intrastat_Id = :Intrastat_Id,'
      '        Currency_Code_def = :Currency_Code,'
      '        VAT_Reference = :VAT_Reference,'
      '        VAT_Code_Def = :VAT_Code_Def,'
      '        EAN_Code = :EAN_Code,'
      '        Our_Account_Code = :Our_Account_Code,'
      '        Our_Account_Password = :Our_Account_Password,'
      '        Transfer_Site_URL = :Transfer_Site_URL,'
      '        Transfer_Protocol_Type = :Transfer_Protocol_Type,'
      '        Courier = :Courier,'
      '        Payment_Terms = :Payment_Terms'
      'Where'
      '(Supplier = :Supplier) '
      '')
    Left = 416
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Intrastat_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'VAT_Code_Def'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EAN_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Our_Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Our_Account_Password'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Transfer_Site_URL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Transfer_Protocol_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Payment_Terms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object GetCurrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Currency_Code, Currency_Code_Descr'
      'from Currency_Code'
      'Order By Currency_Code_Descr')
    Left = 336
    Top = 316
  end
  object GetVATSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * From Vat_Code'
      'Order By Vat_Code')
    Left = 168
    Top = 276
  end
  object qryGetSupplier: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select  Supplier.Supplier,'
      '        Supplier.Name,'
      '        Supplier.Acc_Active,'
      '        Supplier.Discount,'
      '        Supplier.Intrastat_Id,'
      '        Supplier.Country_Id,'
      '        Supplier.VAT_Reference,'
      '        Supplier_Branch.Account_Code,'
      '        Supplier_Branch.Branch_No,'
      '        Supplier_Branch.Building_No_Name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.PostCode,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Fax_Number,'
      '        Supplier_Branch.EMail,'
      '        Supplier_Branch.Narrative,'
      '        Supplier_Branch.Account_Code_On_Ledger,'
      '        Supplier.Currency_Code_Def,'
      '        Supplier.VAT_Code_Def,'
      '        Supplier.EAN_Code,'
      '        Supplier.Our_Account_Code,'
      '        Supplier.Our_Account_Password,'
      '        Supplier.Transfer_Site_URL,'
      '        Supplier.Transfer_Protocol_Type,'
      '        Supplier.Courier,'
      '        Supplier.Payment_Terms'
      'From Supplier, Supplier_Branch'
      'Where (Supplier.Supplier = :Supplier) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Branch_No = 0)'
      'Order By Supplier.Name'
      ' ')
    Left = 24
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryCharges: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Supplier_Charge'
      'where Supplier = :Supplier'
      'order by Charge_no')
    Left = 512
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object dtsCharges: TDataSource
    DataSet = qryCharges
    Left = 576
    Top = 8
  end
  object qryCouriers: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Courier'
      'Order By Courier.Courier_Name')
    Left = 512
    Top = 152
  end
  object dtsCouriers: TDataSource
    DataSet = qryCouriers
    Left = 568
    Top = 152
  end
  object qryDocuments: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supplier_Document'
      'where Supplier = :Supplier'
      'order by Date_Created')
    Left = 504
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object dtsDocuments: TDataSource
    DataSet = qryDocuments
    Left = 592
    Top = 240
  end
  object qryAddDocument: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Supplier_Document'
      '(Supplier,'
      'Document_No,'
      'Document,'
      'Document_Title,'
      'Date_Created'
      ')'
      'Values'
      '(:Supplier,'
      ':Document_No,'
      ':Document,'
      ':Document_Title,'
      ':Date_Created'
      ')')
    Left = 504
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Created'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastDoc: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(document_no) as Last_Document'
      'from Supplier_Document'
      'where Supplier = :Supplier')
    Left = 592
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryDelDocument: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete from Supplier_Document'
      'where Supplier = :Supplier and Document_no = :Document_no')
    Left = 504
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_no'
        ParamType = ptUnknown
      end>
  end
  object qryUpdDocument: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier_Document'
      'set Document = :Document, Document_Title = :Document_Title'
      'where Supplier = :Supplier and Document_no = :Document_no')
    Left = 592
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Document'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetInvoices: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Supplier_invoice'
      'where supplier = :Supplier and '
      'Supp_Invoice_status < 30')
    Left = 32
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryAddReplEntity: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Insert Into Replicate_Entity(Replicate_Entity, Entity, Code1, Co' +
        'de2, Code3, Replicate_Action, Updated)'
      
        'Select ISNULL(Max(Replicate_Entity)+1,1), :Entity, :Code1, :Code' +
        '2, :Code3, :Replicate_Action, '#39'N'#39' FROM Replicate_Entity'
      '')
    Left = 32
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Entity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Replicate_Action'
        ParamType = ptUnknown
      end>
  end
  object qrySuppliersBase: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select  Supplier.Supplier,'
      '        Supplier.Name,'
      '        Supplier_Branch.Narrative,'
      '        Supplier_Branch.Account_Code,'
      '        Supplier_Branch.Fax_Number,'
      '        Supplier_Branch.Branch_No,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Building_no_name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Postcode,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Email,'
      '        Supplier.Acc_Active,'
      '        Supplier.Courier,'
      '        (SELECT top 1 Purchase_order.Date_Point'
      #9'        FROM Purchase_Order'
      #9'        WHERE (Purchase_order.Supplier = Supplier.Supplier)'
      
        #9#9'      ORDER BY Purchase_order.Purchase_order desc) as Last_Ord' +
        'er_Date,'
      '        Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '      RIGHT JOIN (Supplier'
      '      INNER JOIN Supplier_Branch'
      '        ON Supplier.Supplier = Supplier_Branch.Supplier)'
      '        ON Payment_Terms.Payment_Terms = Supplier.Payment_Terms'
      'WHERE'
      '      ('
      '      (Supplier.Name Like :Code_From) or'
      '      (Supplier_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Supplier_Branch.Branch_No = 0)'
      '')
    Left = 136
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end>
  end
  object qryTerms: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Payment_terms'
      'order by Payment_Terms_Description')
    Left = 32
    Top = 456
  end
  object dtsTerms: TDataSource
    DataSet = qryTerms
    Left = 88
    Top = 456
  end
  object OldqrySuppliersBase: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select  Supplier.Supplier,'
      '        Supplier.Name,'
      '        Supplier_Branch.Narrative,'
      '        Supplier_Branch.Account_Code,'
      '        Supplier_Branch.Fax_Number,'
      '        Supplier_Branch.Branch_No,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Building_no_name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Postcode,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Email,'
      '        Supplier.Acc_Active,'
      '        Supplier.Courier,'
      '        (SELECT top 1 Purchase_order.Date_Point'
      #9'        FROM Purchase_Order'
      #9'        WHERE (Purchase_order.Supplier = Supplier.Supplier)'
      
        #9#9'      ORDER BY Purchase_order.Purchase_order desc) as Last_Ord' +
        'er_Date'
      'From Supplier, Supplier_Branch'
      'Where '
      '      ('
      '      (Supplier.Name Like :Code_From) or'
      '      (Supplier_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Branch_No = 0)'
      '')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code_From'
        ParamType = ptUnknown
      end>
  end
end
