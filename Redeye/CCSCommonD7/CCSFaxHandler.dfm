object FaxHandler: TFaxHandler
  OnCreate = DataModuleCreate
  Height = 328
  Width = 648
  object GetOldFaxesQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Select FileName From FaxStat'
      'Where (CreatedOn < :Date_Before)')
    Left = 24
    Top = 48
    ParamData = <
      item
        Name = 'Date_Before'
      end>
  end
  object WaitForFaxFinishTimer: TTimer
    Enabled = False
    OnTimer = WaitForFaxFinishTimerTimer
    Left = 264
  end
  object FaxDatabase: TFDConnection
    ConnectionName = 'faxesSQL'
    Params.Strings = (
      'ConnectionDef=faxes')
    OnError = FaxDatabaseError
    BeforeConnect = FaxDatabaseBeforeConnect
    Left = 24
  end
  object DelFaxQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Delete From Faxstat'
      'Where (FileName = :FileName)')
    Left = 24
    Top = 96
    ParamData = <
      item
        Name = 'FileName'
      end>
  end
  object AddFaxSQL: TFDQuery
    ConnectionName = 'faxesSQL'
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
        Name = 'CreatedOn'
      end
      item
        Name = 'FileName'
      end
      item
        Name = 'PhoneNo'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'NoOfRetries'
      end
      item
        Name = 'LastTried'
        DataType = ftDateTime
      end
      item
        Name = 'UserName'
      end
      item
        Name = 'Description'
      end>
  end
  object qrySelCustBrnchFax: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'customer'
      end
      item
        Name = 'branch'
      end>
  end
end
