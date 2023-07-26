object dtmdlActivity: TdtmdlActivity
  OldCreateOrder = False
  Left = 475
  Top = 143
  Height = 524
  Width = 686
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 296
    Top = 16
  end
  object qryUpActivity: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Activity'
      'SET   Activity_Type = :Activity_Type,'
      '      Activity_Subject = :Activity_Subject,'
      '      Start_Date_Time = :Start_Date_Time,'
      '      Due_Date_Time = :Due_Date_Time,'
      '      Activity_Status = :Activity_Status,'
      '      Activity_Priority = :Activity_Priority,'
      '      Narrative = :Narrative,'
      '      Activity_Module = :Activity_Module,'
      '      Entity_Reference = :Entity_Reference,'
      
        '      Entity_Reference_Description = :Entity_Reference_Descripti' +
        'on,'
      '      Customer = :Customer,'
      '      Branch_no = :Branch_no,'
      '      Contact_no = :Contact_no,'
      '      Assigned_to = :Assigned_to,'
      '      Activity_Reminder = :Activity_Reminder,'
      '      Original_Activity = :Original_Activity'
      'WHERE Activity = :Activity')
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Activity_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Subject'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Start_Date_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Due_Date_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Priority'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Activity_Module'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Entity_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Entity_Reference_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_no'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Assigned_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Reminder'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Activity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity'
        ParamType = ptUnknown
      end>
  end
  object qryGetActivity: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Activity.Activity,'
      '        Activity.Activity_Type,'
      '        Activity_Type.Activity_Type_Description,'
      '        Activity.Activity_Subject,'
      '        Activity.Date_Time_Entered,'
      '        Activity.Start_Date_Time,'
      '        Activity.Due_Date_Time,'
      '        Activity.Activity_Status,'
      '        Activity_Status.Activity_Status_Description,'
      '        Activity.Activity_Priority,'
      '        Activity.Activity_Reminder,'
      '        Activity_Priority.Activity_Priority_Description,'
      '        Activity.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Activity.Narrative,'
      '        Activity.Activity_Module,'
      
        '        Activity_Module.Short_Description as Activity_Short_Desc' +
        'ription,'
      '        Activity.Entity_Reference,'
      '        Activity.Entity_Reference_Description,'
      '        Activity.Customer,'
      '        Activity.Branch_no,'
      '        Activity.Contact_no,'
      '        Activity.Assigned_to,'
      '        Activity.Original_Activity,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Activity.Assigned_to) as Assi' +
        'gned_To_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Activity_Type'
      '      INNER JOIN (Activity_Module'
      '      INNER JOIN (Activity_Status'
      '      INNER JOIN (Activity_Priority'
      '      INNER JOIN Activity'
      
        '        ON Activity_Priority.Activity_Priority = Activity.Activi' +
        'ty_Priority)'
      
        '        ON Activity_Status.Activity_Status = Activity.Activity_S' +
        'tatus)'
      
        '        ON Activity_Module.Activity_Module = Activity.Activity_M' +
        'odule)'
      '        ON Activity_Type.Activity_Type = Activity.Activity_Type)'
      '        ON Operator.Operator = Activity.Operator)'
      '        ON (Customer_Contact.Contact_no = Activity.Contact_no)'
      '          AND (Customer_Contact.Branch_no = Activity.Branch_no)'
      '          AND (Customer_Contact.Customer = Activity.Customer))'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no)'
      
        '          AND (Customer_Branch.Customer = Customer_Contact.Custo' +
        'mer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      'WHERE Activity.Activity = :Activity')
    Left = 32
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Activity'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT Into Activity'
      '        (Activity,'
      '        Activity_type,'
      '        Activity_Subject,'
      '        Date_Time_Entered,'
      '        Start_Date_Time,'
      '        Due_Date_Time,'
      '        Activity_Status,'
      '        Activity_Priority,'
      '        Operator,'
      '        Narrative'
      '        )'
      'SELECT  Max(Activity)+1,'
      '        :Activity_Type,'
      '        :Activity_Subject,'
      '        :Date_Time_Entered,'
      '        :Start_Date_Time,'
      '        :Due_Date_Time,'
      '        :Activity_Status,'
      '        :Activity_Priority,'
      '        :Operator,'
      '        :Narrative'
      'FROM Activity')
    Left = 296
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Activity_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Subject'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Time_Entered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Start_Date_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Due_Date_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity_Priority'
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
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Activity'
      'From Activity'
      'Where Activity_Subject = :Event_GUID'
      ' '
      ' ')
    Left = 296
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Event_GUID'
        ParamType = ptUnknown
      end>
  end
  object qryActivityGrid: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Activity.Activity,'
      '        Activity.Activity_Type,'
      '        Activity_Type.Activity_Type_Description,'
      '        Activity.Activity_Subject,'
      '        Activity.Date_Time_Entered,'
      '        Activity.Start_Date_Time,'
      '        Activity.Due_Date_Time,'
      '        Activity.Activity_Status,'
      '        Activity_Status.Activity_Status_Description,'
      '        Activity.Activity_Priority,'
      '        Activity_Priority.Activity_Priority_Description,'
      '        Activity.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Activity.Activity_Module,'
      '        Activity.Narrative,'
      '        Activity.Entity_Reference,'
      '        Activity.Customer,'
      '        Activity.Branch_no,'
      '        Activity.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Activity.Assigned_to) as Assi' +
        'gned_To_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Activity_Type'
      '      INNER JOIN (Activity_Status'
      '      INNER JOIN (Activity_Priority'
      '      INNER JOIN Activity'
      
        '        ON Activity_Priority.Activity_Priority = Activity.Activi' +
        'ty_Priority)'
      
        '        ON Activity_Status.Activity_Status = Activity.Activity_S' +
        'tatus)'
      '        ON Activity_Type.Activity_Type = Activity.Activity_Type)'
      '        ON Operator.Operator = Activity.Operator)'
      '        ON (Customer_Contact.Contact_no = Activity.Contact_no)'
      '          AND (Customer_Contact.Branch_no = Activity.Branch_no)'
      '          AND (Customer_Contact.Customer = Activity.Customer))'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no)'
      
        '          AND (Customer_Branch.Customer = Customer_Contact.Custo' +
        'mer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      'WHERE Activity.Customer = :Customer'
      'ORDER BY Activity.Due_Date_Time DESC')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsActivityGrid: TDataSource
    DataSet = qryActivityGrid
    Left = 128
    Top = 16
  end
  object qryOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator'
      'Order By Operator.Name')
    Left = 480
    Top = 16
  end
  object dsOperator: TDataSource
    DataSet = qryOperator
    Left = 584
    Top = 16
  end
  object qryCustomerBranches: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Customer_branch'
      'where Customer = :Customer and'
      
        '((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :Inactive' +
        '))'
      'order by Customer_Branch.Name')
    Left = 480
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object qryContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Contact_no,'
      '        Customer_Contact.Name,'
      '        Customer_Contact.Contact_Type,'
      '        Contact_Type.Description as Contact_type_Description,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Level,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Contact.inactive,'
      
        '        Contact_Status.Contact_Status_Descr as Contact_Status_De' +
        'scription,'
      '        Customer_Contact.Def_Markup_perc,'
      '        Customer_Contact.Narrative'
      'FROM Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN (Contact_Type'
      '      INNER JOIN Customer_Contact'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) and'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL))'
      'ORDER BY Name')
    Left = 484
    Top = 128
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
  object dtsCustomerBranches: TDataSource
    DataSet = qryCustomerBranches
    Left = 584
    Top = 72
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 588
    Top = 128
  end
  object qryAssignedTo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Operator'
      
        'Where ((Operator_Can_login = '#39'Y'#39') or (Operator_Can_login is NULL' +
        ') or (Operator = :Operator))'
      'Order By Operator.Name')
    Left = 488
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object dtsAssignedTo: TDataSource
    DataSet = qryAssignedTo
    Left = 592
    Top = 192
  end
  object qryActivityType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Activity_Type'
      'ORDER BY Activity_Type_Description')
    Left = 488
    Top = 256
  end
  object dtsActivityType: TDataSource
    DataSet = qryActivityType
    Left = 592
    Top = 256
  end
  object qryActivityStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Activity_Status'
      'ORDER BY Activity_Status')
    Left = 488
    Top = 312
  end
  object dtsActivityStatus: TDataSource
    DataSet = qryActivityStatus
    Left = 592
    Top = 312
  end
  object qryActivityPriority: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Activity_Priority'
      'ORDER BY Activity_Priority')
    Left = 488
    Top = 376
  end
  object dtsActivityPriority: TDataSource
    DataSet = qryActivityPriority
    Left = 592
    Top = 376
  end
  object qryActivityModule: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Activity_Module'
      'ORDER BY Activity_Module')
    Left = 488
    Top = 432
  end
  object dtsActivityModule: TDataSource
    DataSet = qryActivityModule
    Left = 592
    Top = 432
  end
  object qryActivityBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Activity.Activity,'
      '        Activity.Activity_Type,'
      '        Activity_Type.Activity_Type_Description,'
      '        Activity.Activity_Subject,'
      '        Activity.Date_Time_Entered,'
      '        Activity.Start_Date_Time,'
      '        Activity.Due_Date_Time,'
      '        Activity.Activity_Status,'
      '        Activity_Status.Activity_Status_Description,'
      '        Activity.Activity_Priority,'
      '        Activity_Priority.Activity_Priority_Description,'
      '        Activity.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Activity.Activity_Module,'
      '        Activity.Narrative,'
      '        Activity.Entity_Reference,'
      '        Activity.Customer,'
      '        Activity.Branch_no,'
      '        Activity.Contact_no,'
      '        Activity.Original_Activity,'
      '        Activity.Entity_Reference_Description,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Activity.Assigned_to) as Assi' +
        'gned_To_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Activity_Type'
      '      INNER JOIN (Activity_Status'
      '      INNER JOIN (Activity_Priority'
      '      INNER JOIN Activity'
      
        '        ON Activity_Priority.Activity_Priority = Activity.Activi' +
        'ty_Priority)'
      
        '        ON Activity_Status.Activity_Status = Activity.Activity_S' +
        'tatus)'
      '        ON Activity_Type.Activity_Type = Activity.Activity_Type)'
      '        ON Operator.Operator = Activity.Operator)'
      '        ON (Customer_Contact.Contact_no = Activity.Contact_no)'
      '          AND (Customer_Contact.Branch_no = Activity.Branch_no)'
      '          AND (Customer_Contact.Customer = Activity.Customer))'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no)'
      
        '          AND (Customer_Branch.Customer = Customer_Contact.Custo' +
        'mer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      'WHERE ((Activity.Customer = :Customer) OR (:Customer = 0)) AND'
      
        '      ((Activity.Assigned_to = :Assigned_To) OR (:Assigned_To = ' +
        '0) OR (:Operator = 0))'
      ''
      '')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Assigned_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Assigned_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryActivityReminder: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Activity.Activity,'
      '        Activity.Activity_Type,'
      '        Activity_Type.Activity_Type_Description,'
      '        Activity.Activity_Subject,'
      '        Activity.Date_Time_Entered,'
      '        Activity.Start_Date_Time,'
      '        Activity.Due_Date_Time,'
      '        Activity.Activity_Status,'
      '        Activity_Status.Activity_Status_Description,'
      '        Activity.Activity_Priority,'
      '        Activity_Priority.Activity_Priority_Description,'
      '        Activity.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Activity.Activity_Module,'
      '        Activity.Narrative,'
      '        Activity.Entity_Reference,'
      '        Activity.Customer,'
      '        Activity.Branch_no,'
      '        Activity.Contact_no,'
      '        Activity.Original_Activity,'
      '        Activity.Entity_Reference_Description,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Activity.Assigned_to) as Assi' +
        'gned_To_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Activity_Type'
      '      INNER JOIN (Activity_Status'
      '      INNER JOIN (Activity_Priority'
      '      INNER JOIN Activity'
      
        '        ON Activity_Priority.Activity_Priority = Activity.Activi' +
        'ty_Priority)'
      
        '        ON Activity_Status.Activity_Status = Activity.Activity_S' +
        'tatus)'
      '        ON Activity_Type.Activity_Type = Activity.Activity_Type)'
      '        ON Operator.Operator = Activity.Operator)'
      '        ON (Customer_Contact.Contact_no = Activity.Contact_no)'
      '          AND (Customer_Contact.Branch_no = Activity.Branch_no)'
      '          AND (Customer_Contact.Customer = Activity.Customer))'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no)'
      
        '          AND (Customer_Branch.Customer = Customer_Contact.Custo' +
        'mer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      'WHERE ((Activity.Customer = :Customer) OR (:Customer = 0)) AND'
      '      ((Activity.Activity = :Activity) or (:Activity = 0))'
      'ORDER BY Activity.Due_Date_Time DESC')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Activity'
        ParamType = ptUnknown
      end>
  end
  object dtsActivityReminder: TDataSource
    DataSet = qryActivityReminder
    Left = 128
    Top = 72
  end
  object qryGetLinkedActivities: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Activity.Activity,'
      '        Activity.Activity_Type,'
      '        Activity_Type.Activity_Type_Description,'
      '        Activity.Activity_Subject,'
      '        Activity.Date_Time_Entered,'
      '        Activity.Start_Date_Time,'
      '        Activity.Due_Date_Time,'
      '        Activity.Activity_Status,'
      '        Activity_Status.Activity_Status_Description,'
      '        Activity.Activity_Priority,'
      '        Activity.Activity_Reminder,'
      '        Activity_Priority.Activity_Priority_Description,'
      '        Activity.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Activity.Narrative,'
      '        Activity.Activity_Module,'
      
        '        Activity_Module.Short_Description as Activity_Short_Desc' +
        'ription,'
      '        Activity.Entity_Reference,'
      '        Activity.Entity_Reference_Description,'
      '        Activity.Customer,'
      '        Activity.Branch_no,'
      '        Activity.Contact_no,'
      '        Activity.Assigned_to,'
      '        Activity.Original_Activity,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Activity.Assigned_to) as Assi' +
        'gned_To_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Activity_Type'
      '      INNER JOIN (Activity_Module'
      '      INNER JOIN (Activity_Status'
      '      INNER JOIN (Activity_Priority'
      '      INNER JOIN Activity'
      
        '        ON Activity_Priority.Activity_Priority = Activity.Activi' +
        'ty_Priority)'
      
        '        ON Activity_Status.Activity_Status = Activity.Activity_S' +
        'tatus)'
      
        '        ON Activity_Module.Activity_Module = Activity.Activity_M' +
        'odule)'
      '        ON Activity_Type.Activity_Type = Activity.Activity_Type)'
      '        ON Operator.Operator = Activity.Operator)'
      '        ON (Customer_Contact.Contact_no = Activity.Contact_no)'
      '          AND (Customer_Contact.Branch_no = Activity.Branch_no)'
      '          AND (Customer_Contact.Customer = Activity.Customer))'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no)'
      
        '          AND (Customer_Branch.Customer = Customer_Contact.Custo' +
        'mer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      
        'WHERE ((Activity.Activity = :Activity) OR (Activity.Activity = :' +
        'Original_Activity) OR (Activity.Original_Activity = :Original_Ac' +
        'tivity))'
      'ORDER BY Activity.Due_Date_Time DESC')
    Left = 32
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Activity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Activity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Activity'
        ParamType = ptUnknown
      end>
  end
  object dtsGetLinkedActivities: TDataSource
    DataSet = qryGetLinkedActivities
    Left = 120
    Top = 248
  end
  object qryGetCustomerContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.Contact_no,'
      '        Customer_Contact.Narrative as Contact_Notes,'
      '        Customer_Branch.Narrative as Branch_Notes'
      'FROM Customer_Branch'
      '        INNER JOIN Customer_Contact'
      
        '            ON (Customer_Branch.Branch_no = Customer_Contact.Bra' +
        'nch_no) AND (Customer_Branch.Customer = Customer_Contact.Custome' +
        'r)'
      'WHERE'
      '('
      '(Customer_Contact.Customer = :Customer) AND'
      '(Customer_Contact.Branch_no = :Branch_no) AND'
      '(Customer_Contact.Contact_no = :Contact_no)'
      ')')
    Left = 32
    Top = 312
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
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
end
