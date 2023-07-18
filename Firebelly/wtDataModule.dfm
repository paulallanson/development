object dtmdlWorktops: TdtmdlWorktops
  OldCreateOrder = False
  Left = 134
  Top = 68
  Height = 589
  Width = 1036
  object dtbsWorktops: TFDConnection
    ConnectionDefName = 'Worktop'
    ConnectionName = 'WT'
    Params.Strings = (
      'USER NAME=admin')

    AfterConnect = dtbsWorktopsAfterConnect
    OnLogin = dtbsWorktopsLogin
    Left = 24
    Top = 24
  end
  object qryNewPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Price_Pointer) from Price_Pointer')
    Left = 24
    Top = 80
  end
  object lkpPriceBasis: TFDTable
    ConnectionName = 'WT'
    TableName = 'Price_Basis'
    Left = 24
    Top = 192
    object lkpPriceBasisPrice_Basis: TStringField
      FieldName = 'Price_Basis'
      Size = 2
    end
    object lkpPriceBasisDescription: TStringField
      FieldName = 'Description'
      Size = 80
    end
    object lkpPriceBasisQty_Basis_Required: TStringField
      FieldName = 'Qty_Basis_Required'
      Size = 2
    end
  end
  object qryAddPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'insert into Prices (Price_Pointer,Effective_Date,Price_Basis,Uni' +
        't_Price,'
      'Unit_Cost,Date_Changed,Operator,Price_unit)'
      'values (:Pointer,:Date,:Basis,:Price,:Cost,:Change,:by,:Unit)')
    Left = 24
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pointer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Basis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Change'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'by'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit'
        ParamType = ptUnknown
      end>
  end
  object qryAddPointer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Price_Pointer (Price_Pointer,Price_Type)'
      'values (:Pointer,:Type)'
      '')
    Left = 24
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pointer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Type'
        ParamType = ptUnknown
      end>
  end
  object qryDelPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete from Prices'
      'where Price_pointer = :Price_pointer')
    Left = 96
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryDelPricePointer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete from Price_pointer'
      'where Price_pointer = :price_pointer')
    Left = 176
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  *'
      'from company'
      'where company = 1')
    Left = 24
    Top = 304
  end
  object qryGetLastIntSel: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 104
    Top = 305
  end
  object qryDelWork: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 208
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object qryAddWork: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 304
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Text100'
        ParamType = ptUnknown
      end>
  end
  object qryAddIntSel: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, 0.00, 0.00, 0.00,:text100)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 376
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'text100'
        ParamType = ptUnknown
      end>
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'Set Software_CheckSum  = :Software_CheckSum'
      '')
    Left = 344
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Software_CheckSum'
        ParamType = ptUnknown
      end>
  end
  object qryAddWorkStation: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into WorkStation'
      
        ' (WorkStation, WorkStation_Name, Status_Descr, Software_Version,' +
        ' Logged_in)'
      'Values'
      
        '(:WorkStation,:WorkStation_Name,:Status_Descr, :Software_Version' +
        ', :Logged_in)')
    Left = 512
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WorkStation_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Software_Version'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Logged_in'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorkStation: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select WorkStation from WorkStation'
      'Where WorkStation = :WorkStation')
    Left = 424
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWorkStations: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From WorkStation '
      'Where'
      'WorkStation_Name = :WorkStation_Name AND'
      'Status_Descr = :Status_Descr')
    Left = 424
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_Descr'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWorkStation: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From WorkStation '
      'Where'
      'WorkStation = :WorkStation')
    Left = 424
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from address'
      'where address = :address')
    Left = 512
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'address'
        ParamType = ptUnknown
      end>
  end
  object qryCheckWSLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'SELECT Workstation_Lock.*, Workstation.Workstation_Name, Worksta' +
        'tion.Status_Descr, Operator.Operator_Name'
      'FROM Workstation_Lock, Workstation, Operator'
      'WHERE'
      '(Key_Value_1 = :Key_Value_1 AND'
      'Key_Value_2 = :Key_Value_2 AND'
      'Key_Value_3 = :Key_Value_3 AND'
      'Key_Value_4 = :Key_Value_4 AND'
      'Key_Value_5 = :Key_Value_5 AND'
      'Table_Name = :Table_Name AND'
      'Workstation_Lock.Workstation <> :Workstation) AND'
      'Workstation_Lock.Workstation = Workstation.Workstation AND'
      'Workstation.Status_Descr = Operator.Login_Name')
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Key_Value_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_5'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Table_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastWSLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Lock_No) as Last_Lock_No'
      'from Workstation_Lock'
      'where Workstation = :Workstation')
    Left = 40
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
  object qryAddWSLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Workstation_Lock'
      '(Workstation,'
      'Lock_no,'
      'Key_Value_1,'
      'Key_Value_2,'
      'Key_Value_3,'
      'Key_Value_4,'
      'Key_Value_5,'
      'Table_Name,'
      'Form_Title'
      ')'
      'values'
      '(:Workstation,'
      ':Lock_no,'
      ':Key_Value_1,'
      ':Key_Value_2,'
      ':Key_Value_3,'
      ':Key_Value_4,'
      ':Key_Value_5,'
      ':Table_Name,'
      ':Form_Title'
      ')')
    Left = 144
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lock_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Table_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Form_Title'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWSLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete from Workstation_Lock'
      'where Workstation = :Workstation AND'
      'Key_Value_1 = :Key_Value_1 AND'
      'Key_Value_2 = :Key_Value_2 AND'
      'Key_Value_3 = :Key_Value_3 AND'
      'Key_Value_4 = :Key_Value_4 AND'
      'Key_Value_5 = :Key_Value_5 AND'
      'Table_Name = :Table_Name')
    Left = 144
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Key_Value_5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Table_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * FROM Operator'
      'WHERE Operator = :Operator')
    Left = 304
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Customer.Customer'
      'FROM Customer'
      'WHERE Customer.not_active = '#39'N'#39)
    Left = 304
    Top = 424
  end
  object qryCompanyNew: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  Company,'
      '        Company_Name,'
      '        Last_Invoice_Number,'
      '        Database_Version,'
      '        Use_Trade_Layout,'
      '        Use_Purchase_Ordering,'
      '        Use_Contract_Quoting,'
      '        Delivery_Narrative'
      'from company'
      'where company = 1')
    Left = 104
    Top = 248
  end
  object qryGetOneCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Credit_Status,'
      '        Customer.Credit_Limit,'
      '        Customer.Account_Code,'
      '        Vat.Vat,'
      '        Vat.Vat_Rate,'
      '        Vat.Description,'
      '        Vat.Reverse_Charge,'
      '        Customer.Customer_Name'
      'FROM Vat'
      '      INNER JOIN Customer'
      '        ON Vat.Vat = Customer.Vat'
      'WHERE (Customer.Customer = :Customer);'
      '')
    Left = 304
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryGetCurrentPromo: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Image_Path'
      'From Sale_Offer'
      'WHERE (inactive = '#39'N'#39') AND'
      
        '      (((Effective_Date <= :Current_Date) AND (:Current_Date <= ' +
        'Ineffective_Date)) OR'
      
        '      ((Effective_Date <= :Current_Date) AND (Ineffective_Date I' +
        'S NULL)))'
      'ORDER BY Effective_Date')
    Left = 544
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Current_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Current_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Current_Date'
        ParamType = ptUnknown
      end>
  end
  object qryComp: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 432
    Top = 9
  end
  object qryAddIntSelFull: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Sel5, Tag, text100)'
      'Values'
      
        '(:Int_Sel_Code, :Sel1, :Sel2, :Sel3, :Sel4, :Sel5, :Tag, :Text10' +
        '0)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 552
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel3'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel5'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Tag'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'text100'
        ParamType = ptUnknown
      end>
  end
  object qryCheckSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM AppointmentStatus'
      'WHERE'
      '(Id = :Id AND'
      'User <> :User)')
    Left = 448
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'User'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(ID) as Last_Lock_No'
      'from AppointmentStatus'
      'where User = :User')
    Left = 448
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'User'
        ParamType = ptUnknown
      end>
  end
  object qryAddSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'insert into AppointmentStatus (ID, Is_Opened, [User], Workstatio' +
        'n)'
      'values'
      '('
      ':Id,'
      ':Is_Opened,'
      ':User,'
      ':Workstation'
      ')')
    Left = 552
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Opened'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'User'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete from AppointmentStatus'
      'where'
      'Id = :Id AND Workstation = :Workstation')
    Left = 552
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
  object qryGetDocumentNames: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 792
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Module_ID'
        ParamType = ptUnknown
      end>
  end
  object qryGetRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'WHERE Revenue_Centre = :Revenue_Centre')
    Left = 792
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Product'
      'WHERE Product = :Product')
    Left = 776
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerBranch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Branch.Customer,'
      '        Customer_Branch.Branch_Name'
      'FROM Customer_Branch'
      'WHERE (Customer_Branch.Customer = :Customer) AND'
      '      (Customer_Branch.Branch_no = :Branch_No)'
      '')
    Left = 448
    Top = 480
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
  object qryGetBranches: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Branch'
      'WHERE Customer = :Customer')
    Left = 776
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
end
