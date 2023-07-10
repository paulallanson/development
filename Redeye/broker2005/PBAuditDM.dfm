object PBAuditDataMod: TPBAuditDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 233
  Top = 106
  Height = 480
  Width = 696
  object AddAuditSQL: TQuery
    DatabaseName = 'PB'
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
    Left = 64
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Text'
        ParamType = ptUnknown
      end>
  end
  object Add1stAuditSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type)'
      'Values'
      '(1, :Operator, GetDate(), 0)')
    Left = 64
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object GetAuditDescrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      '{See GetAuditDescr function} ;')
    Left = 64
    Top = 72
  end
  object GetAuditTypeSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Audit_Type'
      'Where (Audit_Type = :Audit_Type)')
    Left = 64
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Audit_Type'
        ParamType = ptUnknown
      end>
  end
  object GetAuditFlagsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Select Audit_Log_Prog, Audit_Log_Upd, Audit_Log_Fields, Audit_Lo' +
        'g_Errors'
      'From Company'
      'Where Company = 1 ')
    Left = 64
    Top = 128
  end
  object GetFldChgTypSQL: TQuery
    DatabaseName = 'PB'
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
    Left = 64
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Audit_Table_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_1_Field'
        ParamType = ptUnknown
      end>
  end
  object Access_Add1stAuditSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Audit_Trail'
      '(Audit_Trail, Operator, Date_Time_Entered, Audit_Type)'
      'Values'
      '(1, :Operator, now(), 0)')
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object Access_AddAuditSQL: TQuery
    DatabaseName = 'PB'
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
    Left = 320
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Code_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Text'
        ParamType = ptUnknown
      end>
  end
end
