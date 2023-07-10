object dtmdlCustJobs: TdtmdlCustJobs
  OldCreateOrder = False
  Left = 51
  Top = 106
  Height = 467
  Width = 742
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 80
    Top = 24
  end
  object qryJobs: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Job'
      'order by Job desc')
    Left = 24
    Top = 24
  end
end
