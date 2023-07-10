object FaxHandler: TFaxHandler
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 195
  Height = 328
  Width = 648
  object GetOldFaxesQuery: TQuery
    DatabaseName = 'faxesSQL'
    SQL.Strings = (
      'Select FileName From FaxStat'
      'Where (CreatedOn < :Date_Before)')
    Left = 24
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Before'
        ParamType = ptUnknown
      end>
  end
  object WaitForFaxFinishTimer: TTimer
    Enabled = False
    OnTimer = WaitForFaxFinishTimerTimer
    Left = 264
  end
  object FaxDatabase: TDatabase
    AliasName = 'faxes'
    DatabaseName = 'faxesSQL'
    SessionName = 'Default'
    OnLogin = FaxDatabaseLogin
    Left = 24
  end
  object DelFaxQuery: TQuery
    DatabaseName = 'faxesSQL'
    SQL.Strings = (
      'Delete From Faxstat'
      'Where (FileName = :FileName)')
    Left = 24
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FileName'
        ParamType = ptUnknown
      end>
  end
  object AddFaxSQL: TQuery
    DatabaseName = 'faxesSQL'
    SQL.Strings = (
      'Insert Into Faxstat'
      '(CreatedOn, FileName, PhoneNo, Status, NoOfRetries, LastTried,'
      ' UserName, Description)'
      'Values'
      
        '(:CreatedOn, :FileName, :PhoneNo, :Status, :NoOfRetries, :LastTr' +
        'ied,'
      ' :UserName, :Description)')
    Left = 24
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CreatedOn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FileName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NoOfRetries'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'LastTried'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qrySelCustBrnchFax: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select customer.name,'
      '  customer_branch.name as branch_name,'
      '  customer_branch.fax_number '
      'from customer inner join customer_branch on '
      '  customer.customer = customer_branch.customer  '
      'where customer_branch.customer = :customer and '
      ' customer_branch.branch_no = :branch;')
    Left = 120
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch'
        ParamType = ptUnknown
      end>
  end
end
