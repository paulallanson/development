object dmBroker: TdmBroker
  OldCreateOrder = False
  Left = 72
  Top = 88
  Height = 617
  Width = 1292
  object PBLDatabase: TDatabase
    AliasName = 'Broker'
    DatabaseName = 'PB'
    Params.Strings = (
      'USER NAME=admin')
    SessionName = 'Default'
    AfterConnect = PBLDatabaseAfterConnect
    OnLogin = PBLDatabaseLogin
    Left = 48
    Top = 16
  end
  object AddIntSelQuery: TQuery
    DatabaseName = 'PB'
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
    Left = 296
    Top = 112
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
  object GetLastIntSelSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 160
    Top = 60
  end
  object DelWorkSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 160
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object AddWorkSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 160
    Top = 172
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
  object GetButtonStatusSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Button_Status'
      'From Operator_Button'
      'Where (Operator = :Operator) and'
      '      (Button_Name = :Button_Name)  '
      ' '
      ' ')
    Left = 320
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Button_Name'
        ParamType = ptUnknown
      end>
  end
  object qryIsEnqQuickQuote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select enquiry_type from enquiry where enquiry = :enquiry')
    Left = 72
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end>
  end
  object qryGetOperator: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Operator'
      'Where (Operator = :Operator)'
      ' ')
    Left = 56
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from company'
      'where company = 1')
    Left = 72
    Top = 248
  end
  object qryGetButtons: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Button_Name, Button_Status'
      'From Operator_Button'
      'Where (Operator = :Operator)'
      ' ')
    Left = 298
    Top = 178
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWorkStation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Redeye'
      'Where'
      'WorkStation = :WorkStation')
    Left = 424
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWorkStations: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Redeye'
      'Where'
      'WorkStation_Name = :WorkStation_Name AND'
      'Status_Descr = :Status_Descr'
      '')
    Left = 424
    Top = 168
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
  object qryGetWorkStation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select WorkStation from WorkStation_Redeye'
      'Where WorkStation = :WorkStation')
    Left = 424
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end>
  end
  object qryAddWorkStation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into WorkStation_Redeye'
      
        ' (WorkStation, WorkStation_Name, Status_Descr, Software_Version,' +
        ' Logged_in)'
      'Values'
      
        '(:WorkStation,:WorkStation_Name,:Status_Descr, :Software_Version' +
        ', :Logged_in)')
    Left = 424
    Top = 32
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
  object qryCheckWSLock: TQuery
    DatabaseName = 'PB'
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
    Left = 72
    Top = 312
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
  object qryGetLastWSLock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Lock_No) as Last_Lock_No'
      'from Workstation_Lock'
      'where Workstation = :Workstation')
    Left = 72
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
  object qryAddWSLock: TQuery
    DatabaseName = 'PB'
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
    Left = 176
    Top = 312
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
  object qryDeleteWSLock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete from Workstation_Lock'
      'where Workstation = :Workstation AND'
      'Key_Value_1 = :Key_Value_1 AND'
      'Key_Value_2 = :Key_Value_2 AND'
      'Key_Value_3 = :Key_Value_3 AND'
      'Key_Value_4 = :Key_Value_4 AND'
      'Key_Value_5 = :Key_Value_5 AND'
      'Table_Name = :Table_Name')
    Left = 176
    Top = 368
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
  object qryDeleteWorkStationLock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Lock '
      'Where'
      'WorkStation = :WorkStation')
    Left = 424
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteWorkStationsLocks: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From WorkStation_Lock'
      'Where'
      '(select distinct Workstation_Redeye.WorkStation_Name'
      ' from Workstation_Redeye'
      ' where'
      
        ' Workstation_Redeye.Workstation = Workstation_Lock.Workstation) ' +
        '= :WorkStation_Name')
    Left = 552
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WorkStation_Name'
        ParamType = ptUnknown
      end>
  end
  object qryFY: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Financial_Year'
      'where Financial_Year = :Financial_Year')
    Left = 552
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object qrySpare: TQuery
    DatabaseName = 'PB'
    Left = 160
    Top = 7
  end
  object qryGetCust: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * From Customer'
      'Where Customer = :Customer')
    Left = 424
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextProductID: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(product_id) as Last_Product_ID'
      'from Part')
    Left = 552
    Top = 168
  end
  object qryDelTempID: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete'
      'From Int_Sel'
      'Where Int_Sel_Code = :Int_Sel_Code'
      '')
    Left = 552
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptInput
      end>
  end
  object qryAddWithKey: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Tag, Text100)'
      'VALUES'
      '(:Key, :Sel1, :Sel2, :Sel3, :Sel4, :Tag, :Text100)'
      ''
      ' '
      ' ')
    Left = 552
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Key'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Tag'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Text100'
        ParamType = ptInput
      end>
  end
  object qryCompBranch: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Company_Branch'
      'where company = 1')
    Left = 160
    Top = 240
  end
  object qryGetOpCustomer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select customer.Customer, customer.Invoice_location'
      'from customer, Operator_invoice_location'
      'where customer = :Customer and'
      'Operator_invoice_location.Operator = :Operator and'
      
        'Operator_invoice_location.Invoice_location = Customer.Invoice_lo' +
        'cation')
    Left = 688
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryUpCompanyDD: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_File_No_Direct_Debit = Last_File_No_Direct_Debit + 1'
      'where Company = 1')
    Left = 688
    Top = 96
  end
  object qryAddReplEntity: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Insert Into Replicate_Entity(Replicate_Entity, Entity, Code1, Co' +
        'de2, Code3, Replicate_Action, Updated, Date_Raised)'
      
        'Select ISNULL(Max(Replicate_Entity)+1,1), :Entity, :Code1, :Code' +
        '2, :Code3, :Replicate_Action, '#39'N'#39', getdate() FROM Replicate_Enti' +
        'ty'
      '')
    Left = 688
    Top = 168
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
  object qryGetSupplierID: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier_ID, acc_active'
      'from Supplier'
      'Where Supplier = :Supplier')
    Left = 688
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryGetCategory: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'where Category = :Category')
    Left = 688
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
  object qryGetStoreStock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT SUM(Store_Quantity) as Total_Stock'
      'FROM Store_Stock'
      'WHERE Part = :Part')
    Left = 792
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 '
      #9#9'Financial_Year.No_of_Periods, '
      #9#9'Period.Period'
      'FROM Financial_Year '
      
        #9'INNER JOIN Period ON Financial_Year.Financial_Year = Period.Fin' +
        'ancial_Year'
      'WHERE Period.Financial_Year = :Financial_Year')
    Left = 552
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object qryCheckActivity: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Activity, Original_Activity'
      'FROM Activity'
      'WHERE Activity_Type = :Activity_Type AND'
      '              Entity_Reference = :Entity_Reference AND'
      '              Operator = :Operator AND'
      '              Activity_Module = :Activity_Module'
      'ORDER BY Activity DESC')
    Left = 296
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Activity_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Entity_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Module'
        ParamType = ptUnknown
      end>
  end
  object qryCustomerSubRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Rep'
      'FROM reps_branches'
      'WHERE customer = :Customer AND'
      'Rep <> :Rep')
    Left = 792
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryGetDocumentNames: TQuery
    DatabaseName = 'PB'
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
  object qryZero: TQuery
    DatabaseName = 'EmailsSQL'
    SQL.Strings = (
      'Insert Into Rep(Rep, Name)'
      'SELECT Max(Rep)+1, :GUID FROM Rep'
      ''
      ''
      ' ')
    Left = 1096
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryUpdEmail: TQuery
    DatabaseName = 'EmailsSQL'
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
    Left = 1096
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Email_Subject'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sender_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sender_Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Recipient_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Recipient_Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Body_Text'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Workstation_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Id'
        ParamType = ptUnknown
      end>
  end
  object qryAddEmail: TQuery
    DatabaseName = 'EmailsSQL'
    SQL.Strings = (
      'Insert Into Email_Log'
      '        (Date_Created,'
      '        Email_Status,'
      '        Email_Subject)'
      'Values (:Date_Created, 10, :GUID)'
      ''
      ''
      ' ')
    Left = 1096
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Created'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetLastEmail: TQuery
    DatabaseName = 'EmailsSQL'
    SQL.Strings = (
      'Select Email_Id'
      'From Email_Log Where Email_Subject = :GUID'
      '')
    Left = 1096
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryAddEmailAttachment: TQuery
    DatabaseName = 'EmailsSQL'
    SQL.Strings = (
      'INSERT INTO Email_Attachment'
      '(Email_ID,'
      'Attachment_Filename'
      ')'
      'VALUES'
      '(:Email_ID,'
      ':Attachment_Filename'
      ')')
    Left = 1096
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Email_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Attachment_Filename'
        ParamType = ptUnknown
      end>
  end
  object EmailDatabase: TDatabase
    AliasName = 'EMails'
    DatabaseName = 'EmailsSQL'
    Params.Strings = (
      '=')
    SessionName = 'Default'
    OnLogin = EmailDatabaseLogin
    Left = 1032
    Top = 32
  end
  object qryGetCustomerRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'order by Is_Main_Rep desc')
    Left = 792
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 872
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerSubRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 reps_branches.Rep'
      'FROM Rep '
      #9'INNER JOIN reps_branches ON Rep.Rep = reps_branches.Rep'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) AND'
      '      (Rep.Rep_Is_Sub_Rep = '#39'Y'#39')')
    Left = 792
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryCompanySupplier: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Company.Company,'
      '        Supplier_Branch.Account_Code'
      'FROM Supplier_Branch'
      '      RIGHT JOIN Company'
      
        '        ON (Supplier_Branch.Branch_no = Company.Branch_no) AND (' +
        'Supplier_Branch.Supplier = Company.Supplier)'
      'WHERE Company = 1')
    Left = 72
    Top = 424
  end
end
