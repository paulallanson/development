object dtmdlCustInvoices: TdtmdlCustInvoices
  Height = 467
  Width = 742
  object dtsInvoices: TDataSource
    DataSet = qryInvoices
    Left = 128
    Top = 24
  end
  object qryInvoices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Invoices'
      'where Customer = :Customer and'
      'Description LIKE :Description'
      'order by Invoice desc')
    Left = 40
    Top = 24
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end>
  end
end
