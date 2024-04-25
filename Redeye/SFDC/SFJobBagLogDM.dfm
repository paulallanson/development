object dtmdlJobBagLog: TdtmdlJobBagLog
  Height = 527
  Width = 738
  object qryProcessGrp: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'Order By Process_group_Description')
    Left = 32
    Top = 24
  end
  object dtsProcessGroup: TDataSource
    DataSet = qryProcessGrp
    Left = 120
    Top = 24
  end
  object qryProcess: TFDQuery
    MasterSource = dtsProcessGroup
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '    Process.Process,'
      '    Process.Process_Description,'
      '    Process.Inactive,'
      '    Process.Prompt_For_Laser_Format,'
      '    Process_Number_Type.Number_Type_Description'
      'from Process, Process_Number_Type'
      'where Process_Group = :Process_Group and'
      'Process.Number_Type = Process_Number_Type.Number_Type and'
      '((inactive is NULL) or (inactive = '#39'N'#39'))'
      'order by Process_Description')
    Left = 32
    Top = 80
    ParamData = <
      item
        Name = 'Process_Group'
      end>
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 120
    Top = 80
  end
  object qryWorkCentre: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre'
      'Order By Work_Centre.Work_Centre_Name')
    Left = 32
    Top = 144
  end
  object dtsWorkCentre: TDataSource
    DataSet = qryWorkCentre
    Left = 120
    Top = 144
  end
  object qryProcessPaper: TFDQuery
    MasterSource = dtsProcess
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Paper_Size.Process,'
      'Process_Paper_Size.Paper_Size,'
      'Paper_Size.Short_Description'
      'from Process_Paper_Size, Paper_Size'
      'where Process = :Process and'
      'Process_Paper_Size.Paper_Size = Paper_Size.Paper_size'
      'Order By Paper_Size.Short_Description')
    Left = 32
    Top = 200
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object dtsProcessPaper: TDataSource
    DataSet = qryProcessPaper
    Left = 120
    Top = 200
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'Pb'
    SQL.Strings = (
      'select  Job_Bag.Job_Bag,'
      '        Job_Bag.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Job_Bag_Descr'
      'from Job_Bag, Customer'
      'where Job_Bag.Job_Bag = :Job_Bag and'
      'Job_Bag.Customer = Customer.Customer')
    Left = 408
    Top = 24
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Job_Bag_Time_Log'
      'Where'
      '(Job_Bag_Time_Log = :Job_Bag_Time_Log)')
    Left = 624
    Top = 16
    ParamData = <
      item
        Name = 'Job_Bag_Time_Log'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Insert Into Job_Bag_Time_Log (Job_Bag_Time_Log, Custom_Paper_Siz' +
        'e)'
      'SELECT Max(Job_Bag_Time_Log)+1, :GUID FROM Job_Bag_Time_Log'
      ''
      ' ')
    Left = 496
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag_Time_Log'
      'Set'
      '        Date_Entered = :Date_Entered,'
      '        Job_Bag = :Job_Bag,'
      '        Date_Point = :Date_Point,'
      '        Process_Group = :Process_Group,'
      '        Process = :Process,'
      '        Work_Centre = :Work_Centre,'
      '        Paper_Size = :Paper_Size,'
      '        Custom_Paper_Size = :Custom_Paper_Size,'
      '        Number_Up = :Number_Up,'
      '        Laser_Format = :Laser_Format,'
      '        Quantity = :Quantity,'
      '        Operator = :Operator,'
      '        Audit_Workstation = :Audit_Workstation,'
      '        Labour_Time_From = :Labour_Time_From,'
      '        Labour_Time_To = :Labour_Time_To ,'
      '        Labour_Hours  = :Labour_Hours,'
      '        Labour_Overtime_Hours  = :Labour_Overtime_Hours,'
      '        Machine_Hours = :Machine_Hours,'
      '        Team_Count = :Team_Count,'
      '        Work_Centre_Operator = :Work_Centre_Operator,'
      '        Operation = :Operation,'
      '        Work_Centre_Assistant = :Work_Centre_Assistant,'
      '        Master_Job_Time_Log = :Master_Job_Time_Log,'
      '        Activity = :Activity,'
      '        Customer = :Customer,'
      '        Hourly_Rate = :Hourly_Rate,'
      '        Machine_hourly_Rate = :Machine_Hourly_Rate,'
      '        Click_Charge = :Click_Charge'
      'Where'
      '(Job_Bag_Time_log = :Job_Bag_Time_Log) '
      ''
      ' '
      ' '
      ' ')
    Left = 560
    Top = 16
    ParamData = <
      item
        Name = 'Date_Entered'
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Work_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Paper_Size'
        DataType = ftInteger
      end
      item
        Name = 'Custom_Paper_Size'
        DataType = ftString
      end
      item
        Name = 'Number_Up'
        DataType = ftInteger
      end
      item
        Name = 'Laser_Format'
        DataType = ftString
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Audit_Workstation'
        DataType = ftString
      end
      item
        Name = 'Labour_Time_From'
        DataType = ftDateTime
      end
      item
        Name = 'Labour_Time_To'
        DataType = ftDateTime
      end
      item
        Name = 'Labour_Hours'
        DataType = ftFloat
      end
      item
        Name = 'Labour_Overtime_Hours'
      end
      item
        Name = 'Machine_Hours'
        DataType = ftFloat
      end
      item
        Name = 'Team_Count'
        DataType = ftInteger
      end
      item
        Name = 'Work_Centre_Operator'
        DataType = ftInteger
      end
      item
        Name = 'Operation'
        DataType = ftInteger
      end
      item
        Name = 'Work_Centre_Assistant'
      end
      item
        Name = 'Master_Job_Time_Log'
        DataType = ftInteger
      end
      item
        Name = 'Activity'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Hourly_Rate'
      end
      item
        Name = 'Machine_Hourly_Rate'
      end
      item
        Name = 'Click_Charge'
      end
      item
        Name = 'Job_Bag_Time_Log'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Job_Bag_Time_Log'
      'From Job_Bag_Time_Log'
      'Where Custom_Paper_Size = :GUID')
    Left = 624
    Top = 72
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Insert Into Job_Bag_Time_Log (Job_Bag_Time_Log, Custom_Paper_Siz' +
        'e)'
      'SELECT Max(Job_Bag_Time_Log)+1, :GUID FROM Job_Bag_Time_Log'
      ''
      ''
      ' ')
    Left = 560
    Top = 72
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryJobLogGrid: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Entered,'
      #9'Job_Bag_Time_Log.Job_Bag,'
      '  Job_bag.Job_Bag_Descr as Job_Bag_Description,'
      #9'Job_Bag.Customer, '
      #9'Job_Bag.Branch_No, '
      #9'Customer.Name as Customer_Name,'
      #9'Customer_Branch.Name as Branch_Name,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      #9'Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Short_Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Custom_Paper_Size,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'Job_Bag_Time_Log.Audit_Workstation,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      '  Job_bag_Time_Log.Team_Count,'
      '  (select WCO.Name'
      '   from Operator WCO'
      
        '   where WCO.Operator = Job_Bag_Time_Log.Work_Centre_Operator) a' +
        's Work_Centre_Operator,'
      '  (select Process_Operation.Operation_Description'
      '   from Process_Operation'
      
        '   where  (Process_Operation.Process = Job_Bag_Time_Log.Process)' +
        ' and'
      
        '          (Process_Operation.Operation = Job_Bag_Time_Log.Operat' +
        'ion)) as Operation_Description'
      'FROM Customer'
      #9'INNER JOIN (Customer_Branch'
      #9'INNER JOIN (Paper_Size'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Work_Centre'
      #9'RIGHT JOIN ((Process_Group'
      #9'INNER JOIN (Job_Bag'
      #9'INNER JOIN Job_Bag_Time_Log'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      
        #9#9'ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Grou' +
        'p)'
      #9'INNER JOIN Process'
      
        #9#9'ON (Process.Process = Job_Bag_Time_Log.Process) AND (Process_G' +
        'roup.Process_Group = Process.Process_Group))'
      #9#9'ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre)'
      #9#9'ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      #9#9'ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        #9#9'ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Custom' +
        'er_Branch.Customer = Job_Bag.Customer))'
      #9#9'ON Customer.Customer = Customer_Branch.Customer'
      'ORDER BY Job_Bag_Time_Log.date_point desc, Job_Bag_Time_log desc')
    Left = 344
    Top = 152
    object qryJobLogGridJob_Bag_Time_Log: TIntegerField
      FieldName = 'Job_Bag_Time_Log'
    end
    object qryJobLogGridDate_Entered: TDateTimeField
      FieldName = 'Date_Entered'
    end
    object qryJobLogGridJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryJobLogGridJob_Bag_Description: TWideStringField
      FieldName = 'Job_Bag_Description'
      FixedChar = True
      Size = 160
    end
    object qryJobLogGridCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryJobLogGridBranch_No: TIntegerField
      FieldName = 'Branch_No'
    end
    object qryJobLogGridCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qryJobLogGridDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryJobLogGridProcess_Group: TIntegerField
      FieldName = 'Process_Group'
    end
    object qryJobLogGridProcess_Group_Description: TWideStringField
      FieldName = 'Process_Group_Description'
      FixedChar = True
      Size = 100
    end
    object qryJobLogGridProcess: TIntegerField
      FieldName = 'Process'
    end
    object qryJobLogGridProcess_Description: TWideStringField
      FieldName = 'Process_Description'
      FixedChar = True
      Size = 100
    end
    object qryJobLogGridWork_Centre: TIntegerField
      FieldName = 'Work_Centre'
    end
    object qryJobLogGridWork_Centre_Name: TWideStringField
      FieldName = 'Work_Centre_Name'
      FixedChar = True
      Size = 100
    end
    object qryJobLogGridPaper_Size: TIntegerField
      FieldName = 'Paper_Size'
    end
    object qryJobLogGridPaper_Size_Description: TWideStringField
      FieldName = 'Paper_Size_Description'
      FixedChar = True
      Size = 30
    end
    object qryJobLogGridCustom_Paper_Size: TWideStringField
      FieldName = 'Custom_Paper_Size'
      FixedChar = True
      Size = 100
    end
    object qryJobLogGridNumber_Up: TIntegerField
      FieldName = 'Number_Up'
    end
    object qryJobLogGridLaser_Format: TWideStringField
      FieldName = 'Laser_Format'
      FixedChar = True
      Size = 2
    end
    object qryJobLogGridQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryJobLogGridOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryJobLogGridOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      FixedChar = True
      Size = 80
    end
    object qryJobLogGridAudit_Workstation: TWideStringField
      FieldName = 'Audit_Workstation'
      FixedChar = True
      Size = 30
    end
    object qryJobLogGridLabour_Time_From: TDateTimeField
      FieldName = 'Labour_Time_From'
    end
    object qryJobLogGridLabour_Time_To: TDateTimeField
      FieldName = 'Labour_Time_To'
    end
    object qryJobLogGridLabour_Hours: TFloatField
      FieldName = 'Labour_Hours'
      DisplayFormat = '##0.00'
    end
    object qryJobLogGridMachine_Hours: TFloatField
      FieldName = 'Machine_Hours'
      DisplayFormat = '##0.00'
    end
    object qryJobLogGridTeam_Count: TIntegerField
      FieldName = 'Team_Count'
    end
    object qryJobLogGridWork_Centre_Operator: TWideStringField
      FieldName = 'Work_Centre_Operator'
      Size = 50
    end
    object qryJobLogGridOperation_Description: TWideStringField
      FieldName = 'Operation_Description'
      Size = 50
    end
    object qryJobLogGridLabour_Overtime_Hours: TFloatField
      FieldName = 'Labour_Overtime_Hours'
      DisplayFormat = '##0.00'
    end
    object qryJobLogGridActivity: TWideStringField
      FieldName = 'Activity'
    end
  end
  object dtsJobLogGrid: TDataSource
    DataSet = qryJobLogGrid
    Left = 424
    Top = 152
  end
  object oldqryJobLogBase: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Entered,'
      #9'Job_Bag_Time_Log.Job_Bag,'
      '  Job_bag.Job_Bag_Descr as Job_Bag_Description,'
      #9'Job_Bag.Customer,'
      #9'Job_Bag.Branch_No,'
      #9'Customer.Name as Customer_Name,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      #9'Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Short_Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Custom_Paper_Size,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'Job_Bag_Time_Log.Audit_Workstation,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Labour_Overtime_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      '  Job_bag_Time_Log.Team_Count,'
      '  Job_bag_Time_Log.Activity,'
      '  Job_bag_Time_Log.Customer,'
      '  (select WCO.Name'
      '   from Work_Centre_Operator WCO'
      
        '   where WCO.Work_Centre_Operator = Job_Bag_Time_Log.Work_Centre' +
        '_Operator) as Work_Centre_Operator,'
      '  (select Process_Operation.Operation_Description'
      '   from Process_Operation'
      
        '   where  (Process_Operation.Process = Job_Bag_Time_Log.Process)' +
        ' and'
      
        '          (Process_Operation.Operation = Job_Bag_Time_Log.Operat' +
        'ion)) as Operation_Description'
      'FROM Work_Centre'
      #9'RIGHT JOIN ((Process_Group'
      #9'INNER JOIN (Paper_Size'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN ((Job_Bag'
      #9'LEFT JOIN Customer'
      #9#9'ON Job_Bag.Customer = Customer.Customer)'
      #9'RIGHT JOIN Job_Bag_Time_Log'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      #9#9'ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      #9#9'ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        #9#9'ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Grou' +
        'p)'
      #9'INNER JOIN Process'
      
        #9#9'ON (Process.Process = Job_Bag_Time_Log.Process) AND (Process_G' +
        'roup.Process_Group = Process.Process_Group))'
      #9#9'ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre'
      'WHERE 1=1'
      '')
    Left = 552
    Top = 152
  end
  object qryWCOperators: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Work_Centre_Operator.*'
      'From Work_Centre_Operator'
      'Where (Work_Centre_Operator.Name Like :Code_From) and'
      '((Process_Group = :Process_Group) or (0 = :Process_Group))'
      'Order By Work_Centre_Operator.Name')
    Left = 344
    Top = 200
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object dtsWCOperators: TDataSource
    DataSet = qryWCOperators
    Left = 424
    Top = 200
  end
  object qryGetProcessGrp: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'where Process_Group = :Process_Group')
    Left = 208
    Top = 24
    ParamData = <
      item
        Name = 'Process_Group'
      end>
  end
  object qryProcessOps: TFDQuery
    MasterSource = dtsProcess
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Operation.Process,'
      'Process_Operation.Operation,'
      'Process_Operation.Operation_Description,'
      'Process_Operation.Inactive,'
      'Process_Operation.Sequence_no'
      'from Process_Operation'
      'where Process = :Process'
      'Order By Process_Operation.Sequence_no, Operation_Description')
    Left = 32
    Top = 256
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object dtsProcessOps: TDataSource
    DataSet = qryProcessOps
    Left = 120
    Top = 256
  end
  object qryGetEmployee: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre_Operator'
      'where Employee_Number = :Employee_Number')
    Left = 344
    Top = 312
    ParamData = <
      item
        Name = 'Employee_Number'
      end>
  end
  object qryGetJobLog: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Entered,'
      #9'Job_Bag_Time_Log.Job_Bag,'
      '  Job_bag.Job_Bag_Descr as Job_Bag_Description,'
      #9'Job_Bag_Time_log.Customer,'
      #9'Job_Bag.Branch_No,'
      #9'Customer.Name as Customer_Name,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      #9'Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Short_Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Custom_Paper_Size,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'Job_Bag_Time_Log.Audit_Workstation,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      '  Job_bag_Time_Log.Team_Count,'
      '  Job_bag_Time_Log.Operation,'
      '  Job_bag_Time_Log.Work_Centre_Operator,'
      '  Work_Centre_Operator.Employee_Number,'
      '  Work_Centre_Operator.Name as Employee_Name,'
      '  Job_bag_Time_Log.Labour_Overtime_Hours,'
      '  Job_bag_Time_Log.Work_Centre_Assistant,'
      '  Job_Bag_Time_Log.Master_Job_Time_Log,'
      '  Job_Bag_Time_Log.Activity,'
      '  Job_Bag_Time_Log.Hourly_Rate'
      'FROM (Work_Centre'
      '    RIGHT JOIN (Work_Centre_Operator'
      '    INNER JOIN ((Process_Group'
      '    INNER JOIN (Paper_Size'
      '    RIGHT JOIN (Operator'
      '    INNER JOIN (Job_Bag'
      '    RIGHT JOIN Job_Bag_Time_Log'
      '      ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      '      ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      '      ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        '      ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_' +
        'Group)'
      '    INNER JOIN Process'
      
        '      ON (Process.Process = Job_Bag_Time_Log.Process) AND (Proce' +
        'ss_Group.Process_Group = Process.Process_Group))'
      
        '      ON Work_Centre_Operator.Work_Centre_Operator = Job_Bag_Tim' +
        'e_Log.Work_Centre_Operator)'
      '      ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre)'
      
        '    LEFT JOIN Customer ON Job_Bag_Time_Log.Customer = Customer.C' +
        'ustomer'
      'WHERE Job_bag_Time_Log.Job_bag_Time_Log = :Job_bag_Time_Log'
      '')
    Left = 624
    Top = 200
    ParamData = <
      item
        Name = 'Job_bag_Time_Log'
      end>
  end
  object qryProcessGrpWC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Process_Group.Process_Group_description,'
      '  Process.Process_Description,'
      '  Work_Centre.Work_Centre,'
      '  Work_Centre.Work_Centre_Name'
      
        'from Process_Group, Process, Process_Work_Centre_Group, Work_Cen' +
        'tre_WC_Group, Work_Centre'
      'where Process_Group.Process_Group = :Process_Group and'
      'Process_Group.Process_Group = Process.Process_Group and'
      'Process.Process = Process_Work_Centre_Group.Process and'
      
        'Process_Work_Centre_Group.Work_Centre_Group = Work_Centre_WC_Gro' +
        'up.Work_Centre_Group and'
      'Work_Centre_WC_Group.Work_Centre = Work_centre.Work_Centre'
      'ORDER BY Work_Centre_Name')
    Left = 32
    Top = 320
    ParamData = <
      item
        Name = 'Process_Group'
      end>
  end
  object dtsProcessGrpWC: TDataSource
    DataSet = qryProcessGrpWC
    Left = 120
    Top = 320
  end
  object qryGetJobTimeLog: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Job_Bag_Time_Log'
      'WHERE Date_Point = :Date_Point and'
      'Process_Group = :Process_Group and'
      'Process = :Process and'
      'Work_Centre_Operator = :Work_Centre_Operator and'
      'Job_Bag = :Job_Bag')
    Left = 624
    Top = 264
    ParamData = <
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Work_Centre_Operator'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryDelMulti: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Job_Bag_Time_Log'
      'Where'
      '(Master_Job_Time_Log = :Master_Job_Time_Log)')
    Left = 504
    Top = 200
    ParamData = <
      item
        Name = 'Master_Job_Time_Log'
      end>
  end
  object qryWCOperatorsBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Work_Centre_Operator.*'
      'From Work_Centre_Operator'
      'Where (Work_Centre_Operator.Name Like :Code_From) and'
      '((Process_Group = :Process_Group) or (0 = :Process_Group))')
    Left = 344
    Top = 256
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object qryOldJobLogBase: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Entered, '
      #9'Job_Bag_Time_Log.Job_Bag, '
      '  Job_bag.Job_Bag_Descr as Job_Bag_Description,'
      #9'Job_Bag.Customer, '
      #9'Job_Bag.Branch_No, '
      #9'Customer.Name as Customer_Name,'
      #9'Customer_Branch.Name as Branch_Name,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      #9'Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Short_Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Custom_Paper_Size,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'Job_Bag_Time_Log.Audit_Workstation,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Labour_Overtime_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      '  Job_bag_Time_Log.Team_Count,'
      '  (select WCO.Name'
      '   from Work_Centre_Operator WCO'
      
        '   where WCO.Work_Centre_Operator = Job_Bag_Time_Log.Work_Centre' +
        '_Operator) as Work_Centre_Operator,'
      '  (select Process_Operation.Operation_Description'
      '   from Process_Operation'
      
        '   where  (Process_Operation.Process = Job_Bag_Time_Log.Process)' +
        ' and'
      
        '          (Process_Operation.Operation = Job_Bag_Time_Log.Operat' +
        'ion)) as Operation_Description'
      'FROM Customer'
      #9'INNER JOIN (Customer_Branch'
      #9'INNER JOIN (Paper_Size'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Work_Centre'
      #9'RIGHT JOIN ((Process_Group'
      #9'INNER JOIN (Job_Bag'
      #9'INNER JOIN Job_Bag_Time_Log'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      
        #9#9'ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Grou' +
        'p)'
      #9'INNER JOIN Process'
      
        #9#9'ON (Process.Process = Job_Bag_Time_Log.Process) AND (Process_G' +
        'roup.Process_Group = Process.Process_Group))'
      #9#9'ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre)'
      #9#9'ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      #9#9'ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        #9#9'ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Custom' +
        'er_Branch.Customer = Job_Bag.Customer))'
      #9#9'ON Customer.Customer = Customer_Branch.Customer'
      'ORDER BY Job_Bag_Time_Log.date_point desc, Job_Bag_Time_log desc')
    Left = 504
    Top = 88
  end
  object qryOldGetJobLog: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Entered, '
      #9'Job_Bag_Time_Log.Job_Bag, '
      '  Job_bag.Job_Bag_Descr as Job_Bag_Description,'
      #9'Job_Bag.Customer, '
      #9'Job_Bag.Branch_No, '
      #9'Customer.Name as Customer_Name,'
      #9'Customer_Branch.Name as Branch_Name,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      #9'Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Short_Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Custom_Paper_Size,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'Job_Bag_Time_Log.Audit_Workstation,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      '  Job_bag_Time_Log.Team_Count,'
      '  Job_bag_Time_Log.Operation,'
      '  Job_bag_Time_Log.Work_Centre_Operator,'
      '  Work_Centre_Operator.Employee_Number,'
      '  Work_Centre_Operator.Name as Employee_Name,'
      '  Job_bag_Time_Log.Labour_Overtime_Hours,'
      '  Job_bag_Time_Log.Work_Centre_Assistant,'
      '  Job_Bag_Time_Log.Master_Job_Time_Log,'
      '  Job_Bag_Time_Log.Non_Job_Bag_Code'
      'FROM (Work_Centre'
      '  RIGHT JOIN ((Process_Group'
      '  INNER JOIN (Paper_Size'
      '  RIGHT JOIN (Operator'
      '  INNER JOIN ((Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN Job_Bag'
      
        '    ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Cust' +
        'omer_Branch.Customer = Job_Bag.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      '  INNER JOIN Job_Bag_Time_Log'
      '    ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      '    ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      '    ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        '    ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Gr' +
        'oup)'
      '  INNER JOIN Process'
      
        '    ON (Process.Process = Job_Bag_Time_Log.Process) AND (Process' +
        '_Group.Process_Group = Process.Process_Group))'
      '    ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre)'
      '  INNER JOIN Work_Centre_Operator'
      
        '    ON (Job_Bag_Time_Log.Work_Centre_Operator = Work_Centre_Oper' +
        'ator.Work_Centre_Operator)'
      'WHERE Job_bag_Time_Log.Job_bag_Time_Log = :Job_bag_Time_Log'
      '')
    Left = 624
    Top = 144
    ParamData = <
      item
        Name = 'Job_bag_Time_Log'
      end>
  end
  object qryGetNonJobTimeLog: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *, Customer.Name as Customer_Name'
      'FROM Customer'
      '      RIGHT JOIN Job_Bag_Time_Log'
      '        ON Customer.Customer = Job_Bag_Time_Log.Customer'
      'WHERE (Job_Bag_Time_Log.Date_Point = :Date_Point) AND'
      '      (Job_Bag_Time_Log.Process_Group = :Process_Group) AND'
      '      (Job_Bag_Time_Log.Process = :Process) AND'
      '      (Job_Bag_Time_Log.Activity = :Activity) AND'
      
        '      (Job_Bag_Time_Log.Work_Centre_Operator = :Work_Centre_Oper' +
        'ator)')
    Left = 624
    Top = 328
    ParamData = <
      item
        Name = 'Date_Point'
        DataType = ftDateTime
      end
      item
        Name = 'Process_Group'
        DataType = ftInteger
      end
      item
        Name = 'Process'
        DataType = ftInteger
      end
      item
        Name = 'Activity'
      end
      item
        Name = 'Work_Centre_Operator'
        DataType = ftInteger
      end>
  end
  object qryActivities: TFDQuery
    MasterSource = dtsProcessGroup
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Group_Activity'
      'where Process_Group = :Process_Group'
      'order by Activity')
    Left = 320
    Top = 80
    ParamData = <
      item
        Name = 'Process_Group'
      end>
  end
  object qryGetEmployeeTime: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '        Job_Bag_Time_Log.Work_Centre_Operator,'
      '        Job_Bag_Time_Log.Date_Point,'
      '        Sum(Labour_Hours) as Total_Labour,'
      '        Sum(Machine_Hours) as Total_Machine,'
      '        Sum(Labour_Overtime_Hours) as Total_Overtime'
      'from Job_Bag_Time_log'
      'where Work_Centre_Operator = :Work_Centre_Operator and'
      '      Date_Point = :Date_Point'
      'Group By'
      '        Job_Bag_Time_Log.Work_Centre_Operator,'
      '        Job_Bag_Time_Log.Date_Point')
    Left = 504
    Top = 256
    ParamData = <
      item
        Name = 'Work_Centre_Operator'
      end
      item
        Name = 'Date_Point'
      end>
  end
  object qryDelJobBagLog: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from job_bag_time_log'
      'where Job_bag_Time_Log = :Job_Bag_Time_Log')
    Left = 408
    Top = 80
    ParamData = <
      item
        Name = 'Job_Bag_Time_Log'
      end>
  end
  object qryGetActivity: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Group_Activity'
      'where Process_Group = :Process_Group and'
      'Activity = :Activity')
    Left = 424
    Top = 312
    ParamData = <
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Activity'
      end>
  end
  object qryJobLogBase: TFDQuery
    SQL.Strings = (
      'SELECT'
      '    Job_Bag_Time_Log.Job_Bag_Time_Log,'
      '    Job_Bag_Time_Log.Date_Entered,'
      '    Job_Bag_Time_Log.Job_Bag,'
      '    Job_Bag.Job_Bag_Descr AS Job_Bag_Description,'
      '    Job_Bag.Customer,'
      '    Job_Bag.Branch_No,'
      '    Customer.Name AS Customer_Name,'
      '    Job_Bag_Time_Log.Date_Point,'
      '    Job_Bag_Time_Log.Process_Group,'
      '    Process_Group.Process_Group_Description,'
      '    Job_Bag_Time_Log.Process,'
      '    Process.Process_Description,'
      '    Job_Bag_Time_Log.Work_Centre,'
      '    Work_Centre.Work_Centre_Name,'
      '    Job_Bag_Time_Log.Paper_Size,'
      '    Paper_Size.Short_Description AS Paper_Size_Description,'
      '    Job_Bag_Time_Log.Custom_Paper_Size,'
      '    Job_Bag_Time_Log.Number_Up,'
      '    Job_Bag_Time_Log.Laser_Format,'
      '    Job_Bag_Time_Log.Quantity,'
      '    Job_Bag_Time_Log.Operator,'
      '    Operator.Name AS Operator_Name,'
      '    Job_Bag_Time_Log.Audit_Workstation,'
      '    Job_Bag_Time_Log.Labour_Time_From,'
      '    Job_Bag_Time_Log.Labour_Time_To,'
      '    Job_Bag_Time_Log.Labour_Hours,'
      '    Job_Bag_Time_Log.Labour_Overtime_Hours,'
      '    Job_Bag_Time_Log.Machine_Hours,'
      '    Job_Bag_Time_Log.Team_Count,'
      '    Job_Bag_Time_Log.Activity,'
      '    Job_Bag_Time_Log.Customer,'
      '    (select WCO.Name'
      '      from Work_Centre_Operator WCO'
      
        '        where WCO.Work_Centre_Operator = Job_Bag_Time_Log.Work_C' +
        'entre_Operator) AS Work_Centre_Operator,'
      '    (select Process_Operation.Operation_Description'
      '      from Process_Operation'
      
        '        where (Process_Operation.Process = Job_Bag_Time_Log.Proc' +
        'ess) and'
      
        '              (Process_Operation.Operation = Job_Bag_Time_Log.Op' +
        'eration)) AS Operation_Description'
      'FROM Customer'
      '  RIGHT JOIN (Work_Centre'
      '  RIGHT JOIN ((Process_Group'
      '  INNER JOIN (Paper_Size'
      '  RIGHT JOIN (Operator'
      '  INNER JOIN (Job_Bag'
      '  RIGHT JOIN Job_Bag_Time_Log'
      '    ON Job_Bag.Job_Bag = Job_Bag_Time_Log.Job_Bag)'
      '    ON Operator.Operator = Job_Bag_Time_Log.Operator)'
      '    ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        '    ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Gr' +
        'oup)'
      '  INNER JOIN Process'
      
        '    ON (Process.Process = Job_Bag_Time_Log.Process) AND (Process' +
        '_Group.Process_Group = Process.Process_Group))'
      '    ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centre)'
      '    ON Customer.Customer = Job_Bag_Time_Log.Customer'
      'WHERE (1=1)')
    Left = 504
    Top = 152
  end
  object qryGetWorkCentre: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre'
      'where Work_Centre = :Work_Centre')
    Left = 504
    Top = 312
    ParamData = <
      item
        Name = 'Work_Centre'
      end>
  end
  object qryGetWorkCentrebyName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre'
      'where Work_Centre_Name = :Work_Centre_Name')
    Left = 504
    Top = 384
    ParamData = <
      item
        Name = 'Work_Centre_Name'
      end>
  end
  object qryGetProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '    Process.Process,'
      '    Process.Process_Description,'
      '    Process.Inactive,'
      '    Process_Number_Type.Number_Type_Description,'
      '    Process.SFDC_Prompt_For_Laser_Format,'
      '    Process.SFDC_Prompt_For_Paper_Size,'
      '    Process.SFDC_Prompt_For_Number_Up'
      'from Process, Process_Number_Type'
      'where process = :Process and'
      'Process.Number_Type = Process_Number_Type.Number_Type')
    Left = 208
    Top = 80
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryGetWorkCentrebyShortName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre'
      'where Work_Centre_Short_Name = :Work_Centre_Short_Name')
    Left = 504
    Top = 440
    ParamData = <
      item
        Name = 'Work_Centre_Short_Name'
      end>
  end
  object qryWCOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre_Operator'
      'where Work_Centre_Operator = :Work_Centre_Operator')
    Left = 344
    Top = 368
    ParamData = <
      item
        Name = 'Work_Centre_Operator'
      end>
  end
end
