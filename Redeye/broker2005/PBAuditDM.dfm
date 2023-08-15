object PBAuditDataMod: TPBAuditDataMod
  OnCreate = DataModuleCreate
  Height = 600
  Width = 870
  PixelsPerInch = 120
  object AddAuditSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      
        '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type, Audit_Cod' +
        'e_1,'
      '        Audit_Code_2, Audit_Code_3, Audit_Code_4,'
      '        Audit_Text)'
      
        'Select Max(Audit_trail)+1, :Operator, GetDate(), :Audit_Type, :A' +
        'udit_Code_1,'
      '        :Audit_Code_2, :Audit_Code_3, :Audit_Code_4,'
      '        :Audit_Text'
      'From Audit_Trail'
      ' ')
    Left = 80
    Top = 370
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Audit_Type'
      end
      item
        Name = 'Audit_Code_1'
      end
      item
        Name = 'Audit_Code_2'
      end
      item
        Name = 'Audit_Code_3'
      end
      item
        Name = 'Audit_Code_4'
      end
      item
        Name = 'Audit_Text'
      end>
  end
  object Add1stAuditSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type)'
      'Values'
      '(1, :Operator, GetDate(), 0)')
    Left = 80
    Top = 20
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object GetAuditDescrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '{See GetAuditDescr function} ;')
    Left = 80
    Top = 90
  end
  object GetAuditTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Audit_Type'
      'Where (Audit_Type = :Audit_Type)')
    Left = 80
    Top = 230
    ParamData = <
      item
        Name = 'Audit_Type'
      end>
  end
  object GetAuditFlagsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Audit_Log_Prog, Audit_Log_Upd, Audit_Log_Fields, Audit_Lo' +
        'g_Errors'
      'From Company'
      'Where Company = 1 ')
    Left = 80
    Top = 160
  end
  object GetFldChgTypSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Audit_Type.Audit_Type,'
      '        AT2.Audit_Code_1_Field,'
      '        AT2.Audit_Code_2_Field,'
      '        AT2.Audit_Code_3_Field,'
      '        AT2.Audit_Code_4_Field,'
      '        AT2.Audit_Type_Descr'
      'From Audit_Type, Audit_Type AT2'
      
        'Where (Audit_Type.Audit_Type >= 10000) and (Audit_Type.Audit_Typ' +
        'e < 99999) and'
      '      (Audit_Type.Audit_Table_Name = :Audit_Table_Name) and'
      '      (Audit_Type.Audit_Code_1_Field = :Audit_Code_1_Field) and'
      '      (Audit_Type.Audit_Table_Name = AT2.Audit_Table_Name) and'
      '      (AT2.Audit_Type >= 2000) and (AT2.Audit_Type < 3000)'
      ''
      ' ')
    Left = 80
    Top = 300
    ParamData = <
      item
        Name = 'Audit_Table_Name'
      end
      item
        Name = 'Audit_Code_1_Field'
      end>
  end
  object Access_Add1stAuditSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type)'
      'Values'
      '(1, :Operator, now(), 0)')
    Left = 390
    Top = 20
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object Access_AddAuditSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      
        '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type, Audit_Cod' +
        'e_1,'
      '        Audit_Code_2, Audit_Code_3, Audit_Code_4,'
      '        Audit_Text)'
      
        'Select Max(Audit_trail)+1, :Operator, now(), :Audit_Type, :Audit' +
        '_Code_1,'
      '        :Audit_Code_2, :Audit_Code_3, :Audit_Code_4,'
      '        :Audit_Text'
      'From Audit_Trail'
      ' ')
    Left = 400
    Top = 360
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Audit_Type'
      end
      item
        Name = 'Audit_Code_1'
      end
      item
        Name = 'Audit_Code_2'
      end
      item
        Name = 'Audit_Code_3'
      end
      item
        Name = 'Audit_Code_4'
      end
      item
        Name = 'Audit_Text'
      end>
  end
end
