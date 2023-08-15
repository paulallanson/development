object dmBroker: TdmBroker
  Height = 771
  Width = 1615
  PixelsPerInch = 120
  object PBLDatabase: TFDConnection
    ConnectionName = 'PB'
    Params.Strings = (
      'ConnectionDef=RedEye')
    OnLogin = PBLDatabaseLogin
    AfterConnect = PBLDatabaseAfterConnect
    BeforeConnect = PBLDatabaseBeforeConnect
    Left = 60
    Top = 20
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
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
    Left = 370
    Top = 140
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
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 200
    Top = 75
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 200
    Top = 145
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 200
    Top = 215
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object GetButtonStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Button_Status'
      'From Operator_Button'
      'Where (Operator = :Operator) and'
      '      (Button_Name = :Button_Name)  '
      ' '
      ' ')
    Left = 400
    Top = 35
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Button_Name'
      end>
  end
  object qryIsEnqQuickQuote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select enquiry_type from enquiry where enquiry = :enquiry')
    Left = 90
    Top = 220
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Operator'
      'Where (Operator = :Operator)'
      ' ')
    Left = 70
    Top = 95
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from company'
      'where company = 1')
    Left = 90
    Top = 310
  end
  object qryGetButtons: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Button_Name, Button_Status'
      'From Operator_Button'
      'Where (Operator = :Operator)'
      ' ')
    Left = 373
    Top = 223
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryDeleteWorkStation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Redeye'
      'Where'
      'WorkStation = :WorkStation')
    Left = 530
    Top = 280
    ParamData = <
      item
        Name = 'WorkStation'
      end>
  end
  object qryDeleteWorkStations: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Redeye'
      'Where'
      'WorkStation_Name = :WorkStation_Name AND'
      'Status_Descr = :Status_Descr'
      '')
    Left = 530
    Top = 210
    ParamData = <
      item
        Name = 'WorkStation_Name'
      end
      item
        Name = 'Status_Descr'
      end>
  end
  object qryGetWorkStation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select WorkStation from WorkStation_Redeye'
      'Where WorkStation = :WorkStation')
    Left = 530
    Top = 130
    ParamData = <
      item
        Name = 'WorkStation'
      end>
  end
  object qryAddWorkStation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into WorkStation_Redeye'
      
        ' (WorkStation, WorkStation_Name, Status_Descr, Software_Version,' +
        ' Logged_in)'
      'Values'
      
        '(:WorkStation,:WorkStation_Name,:Status_Descr, :Software_Version' +
        ', :Logged_in)')
    Left = 530
    Top = 40
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
  object qryCheckWSLock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Workstation_Lock.*, Workstation_Redeye.Workstation_Name, ' +
        'Workstation_Redeye.Status_Descr, Operator.Name as Operator_Name'
      'FROM Workstation_Lock, Workstation_Redeye, Operator'
      'WHERE'
      '(Key_Value_1 = :Key_Value_1 AND'
      'Key_Value_2 = :Key_Value_2 AND'
      'Key_Value_3 = :Key_Value_3 AND'
      'Key_Value_4 = :Key_Value_4 AND'
      'Key_Value_5 = :Key_Value_5 AND'
      'Table_Name = :Table_Name AND'
      'Workstation_Lock.Workstation <> :Workstation) AND'
      
        'Workstation_Lock.Workstation = Workstation_Redeye.Workstation AN' +
        'D'
      'Workstation_Redeye.Status_Descr = Operator.Login_Name')
    Left = 90
    Top = 390
    ParamData = <
      item
        Name = 'Key_Value_1'
      end
      item
        Name = 'Key_Value_2'
      end
      item
        Name = 'Key_Value_3'
      end
      item
        Name = 'Key_Value_4'
      end
      item
        Name = 'Key_Value_5'
      end
      item
        Name = 'Table_Name'
        DataType = ftString
      end
      item
        Name = 'Workstation'
        DataType = ftString
      end>
  end
  object qryGetLastWSLock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Lock_No) as Last_Lock_No'
      'from Workstation_Lock'
      'where Workstation = :Workstation')
    Left = 90
    Top = 460
    ParamData = <
      item
        Name = 'Workstation'
      end>
  end
  object qryAddWSLock: TFDQuery
    ConnectionName = 'PB'
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
    Left = 220
    Top = 390
    ParamData = <
      item
        Name = 'Workstation'
      end
      item
        Name = 'Lock_no'
      end
      item
        Name = 'Key_Value_1'
      end
      item
        Name = 'Key_Value_2'
      end
      item
        Name = 'Key_Value_3'
      end
      item
        Name = 'Key_Value_4'
      end
      item
        Name = 'Key_Value_5'
      end
      item
        Name = 'Table_Name'
      end
      item
        Name = 'Form_Title'
      end>
  end
  object qryDeleteWSLock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Workstation_Lock'
      'where Workstation = :Workstation AND'
      'Key_Value_1 = :Key_Value_1 AND'
      'Key_Value_2 = :Key_Value_2 AND'
      'Key_Value_3 = :Key_Value_3 AND'
      'Key_Value_4 = :Key_Value_4 AND'
      'Key_Value_5 = :Key_Value_5 AND'
      'Table_Name = :Table_Name')
    Left = 220
    Top = 460
    ParamData = <
      item
        Name = 'Workstation'
      end
      item
        Name = 'Key_Value_1'
      end
      item
        Name = 'Key_Value_2'
      end
      item
        Name = 'Key_Value_3'
      end
      item
        Name = 'Key_Value_4'
      end
      item
        Name = 'Key_Value_5'
      end
      item
        Name = 'Table_Name'
      end>
  end
  object qryDeleteWorkStationLock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Lock '
      'Where'
      'WorkStation = :WorkStation')
    Left = 530
    Top = 360
    ParamData = <
      item
        Name = 'WorkStation'
      end>
  end
  object qryDeleteWorkStationsLocks: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Lock'
      'Where'
      '(select distinct Workstation_Redeye.WorkStation_Name'
      ' from Workstation_Redeye'
      ' where'
      
        ' Workstation_Redeye.Workstation = Workstation_Lock.Workstation) ' +
        '= :WorkStation_Name')
    Left = 690
    Top = 40
    ParamData = <
      item
        Name = 'WorkStation_Name'
      end>
  end
  object qryFY: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Financial_Year'
      'where Financial_Year = :Financial_Year')
    Left = 690
    Top = 120
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qrySpare: TFDQuery
    ConnectionName = 'PB'
    Left = 200
    Top = 9
  end
  object qryGetCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Customer'
      'Where Customer = :Customer')
    Left = 530
    Top = 425
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetNextProductID: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(product_id) as Last_Product_ID'
      'from Part')
    Left = 690
    Top = 210
  end
  object qryDelTempID: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete'
      'From Int_Sel'
      'Where Int_Sel_Code = :Int_Sel_Code'
      '')
    Left = 690
    Top = 290
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryAddWithKey: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Tag, Text100)'
      'VALUES'
      '(:Key, :Sel1, :Sel2, :Sel3, :Sel4, :Tag, :Text100)'
      ''
      ' '
      ' ')
    Left = 690
    Top = 360
    ParamData = <
      item
        Name = 'Key'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Tag'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Text100'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryCompBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Company_Branch'
      'where company = 1')
    Left = 200
    Top = 300
  end
  object qryGetOpCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select customer.Customer, customer.Invoice_location'
      'from customer, Operator_invoice_location'
      'where customer = :Customer and'
      'Operator_invoice_location.Operator = :Operator and'
      
        'Operator_invoice_location.Invoice_location = Customer.Invoice_lo' +
        'cation')
    Left = 860
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryUpCompanyDD: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_File_No_Direct_Debit = Last_File_No_Direct_Debit + 1'
      'where Company = 1')
    Left = 860
    Top = 120
  end
  object qryAddReplEntity: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Insert Into Replicate_Entity(Replicate_Entity, Entity, Code1, Co' +
        'de2, Code3, Replicate_Action, Updated, Date_Raised)'
      
        'Select ISNULL(Max(Replicate_Entity)+1,1), :Entity, :Code1, :Code' +
        '2, :Code3, :Replicate_Action, '#39'N'#39', getdate() FROM Replicate_Enti' +
        'ty'
      '')
    Left = 860
    Top = 210
    ParamData = <
      item
        Name = 'Entity'
      end
      item
        Name = 'Code1'
      end
      item
        Name = 'Code2'
      end
      item
        Name = 'Code3'
      end
      item
        Name = 'Replicate_Action'
      end>
  end
  object qryGetSupplierID: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier_ID, acc_active'
      'from Supplier'
      'Where Supplier = :Supplier')
    Left = 860
    Top = 280
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryGetCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'where Category = :Category')
    Left = 860
    Top = 360
    ParamData = <
      item
        Name = 'Category'
      end>
  end
  object qryGetStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT SUM(Store_Quantity) as Total_Stock'
      'FROM Store_Stock'
      'WHERE Part = :Part')
    Left = 990
    Top = 40
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryGetPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 '
      #9#9'Financial_Year.No_of_Periods, '
      #9#9'Period.Period'
      'FROM Financial_Year '
      
        #9'INNER JOIN Period ON Financial_Year.Financial_Year = Period.Fin' +
        'ancial_Year'
      'WHERE Period.Financial_Year = :Financial_Year')
    Left = 690
    Top = 430
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryCheckActivity: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Activity, Original_Activity'
      'FROM Activity'
      'WHERE Activity_Type = :Activity_Type AND'
      '              Entity_Reference = :Entity_Reference AND'
      '              Operator = :Operator AND'
      '              Activity_Module = :Activity_Module'
      'ORDER BY Activity DESC')
    Left = 370
    Top = 300
    ParamData = <
      item
        Name = 'Activity_Type'
      end
      item
        Name = 'Entity_Reference'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Activity_Module'
      end>
  end
  object qryCustomerSubRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Rep'
      'FROM reps_branches'
      'WHERE customer = :Customer AND'
      'Rep <> :Rep')
    Left = 990
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryGetDocumentNames: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 990
    Top = 360
    ParamData = <
      item
        Name = 'Module_ID'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'EmailsSQL'
    SQL.Strings = (
      'Insert Into Rep(Rep, Name)'
      'SELECT Max(Rep)+1, :GUID FROM Rep'
      ''
      ''
      ' ')
    Left = 1370
    Top = 220
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryUpdEmail: TFDQuery
    ConnectionName = 'EmailsSQL'
    SQL.Strings = (
      'Update Email_Log'
      'Set'
      '  Email_Subject = :Email_Subject,'
      '  Sender_Name = :Sender_Name,'
      '  Sender_Email = :Sender_Email,'
      '  Recipient_Name = :Recipient_Name,'
      '  Recipient_Email = :Recipient_Email,'
      '  Body_Text = :Body_Text,'
      '  Operator_Name = :Operator_Name,'
      '  Workstation_Name = :Workstation_Name'
      'Where'
      '  Email_Id = :Email_Id')
    Left = 1370
    Top = 100
    ParamData = <
      item
        Name = 'Email_Subject'
      end
      item
        Name = 'Sender_Name'
      end
      item
        Name = 'Sender_Email'
      end
      item
        Name = 'Recipient_Name'
      end
      item
        Name = 'Recipient_Email'
      end
      item
        Name = 'Body_Text'
      end
      item
        Name = 'Operator_Name'
      end
      item
        Name = 'Workstation_Name'
      end
      item
        Name = 'Email_Id'
      end>
  end
  object qryAddEmail: TFDQuery
    ConnectionName = 'EmailsSQL'
    SQL.Strings = (
      'Insert Into Email_Log'
      '        (Date_Created,'
      '        Email_Status,'
      '        Email_Subject)'
      'Values (:Date_Created, 10, :GUID)'
      ''
      ''
      ' ')
    Left = 1370
    Top = 40
    ParamData = <
      item
        Name = 'Date_Created'
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLastEmail: TFDQuery
    ConnectionName = 'EmailsSQL'
    SQL.Strings = (
      'Select Email_Id'
      'From Email_Log Where Email_Subject = :GUID'
      '')
    Left = 1370
    Top = 160
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryAddEmailAttachment: TFDQuery
    ConnectionName = 'EmailsSQL'
    SQL.Strings = (
      'INSERT INTO Email_Attachment'
      '(Email_ID,'
      'Attachment_Filename'
      ')'
      'VALUES'
      '(:Email_ID,'
      ':Attachment_Filename'
      ')')
    Left = 1370
    Top = 290
    ParamData = <
      item
        Name = 'Email_ID'
      end
      item
        Name = 'Attachment_Filename'
      end>
  end
  object EmailDatabase: TFDConnection
    ConnectionName = 'EmailsSQL'
    Params.Strings = (
      '='
      'ConnectionDef=Redeye')
    OnLogin = EmailDatabaseLogin
    Left = 1290
    Top = 40
  end
  object qryGetCustomerRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'order by Is_Main_Rep desc')
    Left = 990
    Top = 210
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 1090
    Top = 210
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object qryGetCustomerSubRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 reps_branches.Rep'
      'FROM Rep '
      #9'INNER JOIN reps_branches ON Rep.Rep = reps_branches.Rep'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) AND'
      '      (Rep.Rep_Is_Sub_Rep = '#39'Y'#39')')
    Left = 990
    Top = 280
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryCompanySupplier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Company.Company,'
      '        Supplier_Branch.Account_Code'
      'FROM Supplier_Branch'
      '      RIGHT JOIN Company'
      
        '        ON (Supplier_Branch.Branch_no = Company.Branch_no) AND (' +
        'Supplier_Branch.Supplier = Company.Supplier)'
      'WHERE Company = 1')
    Left = 90
    Top = 530
  end
end
