object DataBroker: TDataBroker
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 311
  Width = 473
  object qryLayout: TFDQuery
    SQL.Strings = (
      'SELECT * FROM tb_PageLayout WHERE f_PageLayoutName = :Name')
    Left = 88
    Top = 8
    ParamData = <
      item
        Name = 'Name'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryCompany: TFDQuery
    SQL.Strings = (
      'SELECT Name, Building_No_Name, Street, Locale, Town, Postcode,'
      
        'Phone, Fax_Number, Supplier_Phone, Supplier_Fax, Web_Address, Em' +
        'ail, Company_Reg_no, VAT_Registration_no, Registered_Office_Addr' +
        'ess'
      'FROM Company WHERE Company = 1'
      ''
      ' ')
    Left = 16
    Top = 8
  end
  object qryFormRef: TFDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM Form_Reference WHERE Form_Reference = :Ref'
      ''
      ' ')
    Left = 152
    Top = 8
    ParamData = <
      item
        Name = 'Ref'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      
        'FROM FSC_Material_Claim WHERE FSC_Material_Claim = :FSC_Material' +
        '_Claim'
      ''
      ' ')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
