object emailHandler: TemailHandler
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 304
  Width = 730
  object qrySelCustomerContacts: TFDQuery
    ConnectionName = 'Wt'
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
        Name = 'customer'
      end
      item
        Name = 'branch'
      end>
  end
  object qryEmailList: TFDQuery
    ConnectionName = 'Wt'
    Left = 192
    Top = 16
  end
end
