object dtmdlWorktops: TdtmdlWorktops
  OnCreate = DataModuleCreate
  Height = 736
  Width = 1295
  PixelsPerInch = 120
  object dtbsWorktops: TFDConnection
    ConnectionName = 'WT'
    Params.Strings = (
      'ConnectionDef=Worktop')
    LoginPrompt = False
    OnLogin = dtbsWorktopsLogin
    AfterConnect = dtbsWorktopsAfterConnect
    BeforeConnect = dtbsWorktopsBeforeConnect
    Left = 30
    Top = 30
  end
  object qryNewPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Price_Pointer) from Price_Pointer')
    Left = 30
    Top = 100
  end
  object lkpPriceBasis: TFDTable
    IndexFieldNames = 'Price_Basis'
    Connection = dtbsWorktops
    TableName = 'Price_Basis'
    Left = 30
    Top = 240
    object lkpPriceBasisPrice_Basis: TWideStringField
      FieldName = 'Price_Basis'
      Origin = 'Price_Basis'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object lkpPriceBasisDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 40
    end
    object lkpPriceBasisQty_Basis_Required: TWideStringField
      FieldName = 'Qty_Basis_Required'
      Origin = 'Qty_Basis_Required'
      Required = True
      Size = 1
    end
  end
  object qryAddPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'insert into Prices (Price_Pointer,Effective_Date,Price_Basis,Uni' +
        't_Price,'
      'Unit_Cost,Date_Changed,Operator,Price_unit)'
      'values (:Pointer,:Date,:Basis,:Price,:Cost,:Change,:by,:Unit)')
    Left = 30
    Top = 170
    ParamData = <
      item
        Name = 'Pointer'
      end
      item
        Name = 'Date'
      end
      item
        Name = 'Basis'
      end
      item
        Name = 'Price'
      end
      item
        Name = 'Cost'
      end
      item
        Name = 'Change'
      end
      item
        Name = 'by'
      end
      item
        Name = 'Unit'
      end>
  end
  object qryAddPointer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Price_Pointer (Price_Pointer,Price_Type)'
      'values (:Pointer,:Type)'
      '')
    Left = 30
    Top = 310
    ParamData = <
      item
        Name = 'Pointer'
      end
      item
        Name = 'Type'
      end>
  end
  object qryDelPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete from Prices'
      'where Price_pointer = :Price_pointer')
    Left = 128
    Top = 170
    ParamData = <
      item
        Name = 'Price_pointer'
      end>
  end
  object qryDelPricePointer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete from Price_pointer'
      'where Price_pointer = :price_pointer')
    Left = 244
    Top = 170
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  *'
      'from company'
      'where company = 1')
    Left = 30
    Top = 380
  end
  object qryGetLastIntSel: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 130
    Top = 381
  end
  object qryDelWork: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 260
    Top = 381
    ParamData = <
      item
        Name = 'Int_Sel_Code'
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
    Left = 380
    Top = 381
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
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
    Left = 470
    Top = 381
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
        DataType = ftFloat
      end
      item
        Name = 'text100'
        DataType = ftString
      end>
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'Set Software_CheckSum  = :Software_CheckSum'
      '')
    Left = 430
    Top = 10
    ParamData = <
      item
        Name = 'Software_CheckSum'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    Left = 656
    Top = 111
    ParamData = <
      item
        Name = 'WorkStation'
      end
      item
        Name = 'WorkStation_Name'
      end
      item
        Name = 'Status_Descr'
      end
      item
        Name = 'Software_Version'
      end
      item
        Name = 'Logged_in'
      end>
  end
  object qryGetWorkStation: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select WorkStation from WorkStation'
      'Where WorkStation = :WorkStation')
    Left = 506
    Top = 113
    ParamData = <
      item
        Name = 'WorkStation'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryDeleteWorkStations: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From WorkStation '
      'Where'
      'WorkStation_Name = :WorkStation_Name AND'
      'Status_Descr = :Status_Descr')
    Left = 530
    Top = 200
    ParamData = <
      item
        Name = 'WorkStation_Name'
      end
      item
        Name = 'Status_Descr'
      end>
  end
  object qryDeleteWorkStation: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From WorkStation '
      'Where'
      'WorkStation = :WorkStation')
    Left = 530
    Top = 270
    ParamData = <
      item
        Name = 'WorkStation'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from address'
      'where address = :address')
    Left = 648
    Top = 13
    ParamData = <
      item
        Name = 'address'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    Left = 50
    Top = 470
    ParamData = <
      item
        Name = 'Key_Value_1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_3'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_4'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_5'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Table_Name'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Workstation'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetLastWSLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Lock_No) as Last_Lock_No'
      'from Workstation_Lock'
      'where Workstation = :Workstation')
    Left = 50
    Top = 540
    ParamData = <
      item
        Name = 'Workstation'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    Left = 180
    Top = 470
    ParamData = <
      item
        Name = 'Workstation'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Lock_no'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_3'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_4'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Key_Value_5'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Table_Name'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Form_Title'
        DataType = ftString
        ParamType = ptInput
        Value = Null
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
    Left = 180
    Top = 540
    ParamData = <
      item
        Name = 'Workstation'
        ParamType = ptInput
      end
      item
        Name = 'Key_Value_1'
        ParamType = ptInput
      end
      item
        Name = 'Key_Value_2'
        ParamType = ptInput
      end
      item
        Name = 'Key_Value_3'
        ParamType = ptInput
      end
      item
        Name = 'Key_Value_4'
        ParamType = ptInput
      end
      item
        Name = 'Key_Value_5'
        ParamType = ptInput
      end
      item
        Name = 'Table_Name'
        ParamType = ptInput
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * FROM Operator'
      'WHERE Operator = :Operator')
    Left = 380
    Top = 460
    ParamData = <
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Customer.Customer'
      'FROM Customer'
      'WHERE Customer.not_active = '#39'N'#39)
    Left = 380
    Top = 530
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
    Left = 154
    Top = 310
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
    Left = 380
    Top = 600
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    Left = 680
    Top = 200
    ParamData = <
      item
        Name = 'Current_Date'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryComp: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 540
    Top = 11
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
    Left = 690
    Top = 381
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftFloat
      end
      item
        Name = 'Sel2'
        DataType = ftFloat
      end
      item
        Name = 'Sel3'
        DataType = ftFloat
      end
      item
        Name = 'Sel4'
        DataType = ftFloat
      end
      item
        Name = 'Sel5'
      end
      item
        Name = 'Tag'
        DataType = ftString
      end
      item
        Name = 'text100'
        DataType = ftString
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
    Left = 560
    Top = 470
    ParamData = <
      item
        Name = 'Id'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'User'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetLastSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(ID) as Last_Lock_No'
      'from AppointmentStatus'
      'where User = :User')
    Left = 560
    Top = 540
    ParamData = <
      item
        Name = 'User'
        DataType = ftString
        ParamType = ptInput
        Value = Null
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
    Left = 690
    Top = 470
    ParamData = <
      item
        Name = 'Id'
      end
      item
        Name = 'Is_Opened'
      end
      item
        Name = 'User'
      end
      item
        Name = 'Workstation'
      end>
  end
  object qryDeleteSOLock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete from AppointmentStatus'
      'where'
      'Id = :Id AND Workstation = :Workstation')
    Left = 690
    Top = 540
    ParamData = <
      item
        Name = 'Id'
      end
      item
        Name = 'Workstation'
      end>
  end
  object qryGetDocumentNames: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 990
    Top = 360
    ParamData = <
      item
        Name = 'Module_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'WHERE Revenue_Centre = :Revenue_Centre')
    Left = 990
    Top = 440
    ParamData = <
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Product'
      'WHERE Product = :Product')
    Left = 970
    Top = 40
    ParamData = <
      item
        Name = 'Product'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    Left = 560
    Top = 600
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetBranches: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Branch'
      'WHERE Customer = :Customer')
    Left = 970
    Top = 116
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
