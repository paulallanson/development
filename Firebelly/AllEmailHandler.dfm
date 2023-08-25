object emailHandler: TemailHandler
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 380
  Width = 913
  PixelsPerInch = 120
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
    Left = 90
    Top = 20
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
    Left = 240
    Top = 20
  end
end
