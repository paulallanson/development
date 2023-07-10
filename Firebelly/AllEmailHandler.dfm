object emailHandler: TemailHandler
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 226
  Top = 153
  Height = 304
  Width = 674
  object qrySelCustomerContacts: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'select customer_contact.*,'
      '  contact_type.Description as contact_type_desc,'
      '  exportfilter.description as export_filter_desc '
      'from (customer_contact inner join contact_type on '
      ' customer_contact.contact_type = contact_type.contact_type)'
      ' left join exportfilter on'
      ' customer_contact.exportfilter = exportfilter.exportfilter'
      'where customer = :customer and '
      ' branch_no = :branch;'
      ' ')
    Left = 72
    Top = 16
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
  object qryEmailList: TQuery
    DatabaseName = 'Wt'
    Left = 240
    Top = 16
  end
end
