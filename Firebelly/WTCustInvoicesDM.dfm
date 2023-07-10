object dtmdlCustInvoices: TdtmdlCustInvoices
  OldCreateOrder = False
  Left = 51
  Top = 106
  Height = 467
  Width = 742
  object dtsInvoices: TDataSource
    DataSet = qryInvoices
    Left = 80
    Top = 24
  end
  object qryInvoices: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Invoices'
      'where Customer = :Customer and'
      'Description LIKE :Description'
      'order by Invoice desc')
    Left = 24
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
end
