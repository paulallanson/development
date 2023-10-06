object dmIntSel: TdmIntSel
  Height = 540
  Width = 783
  object GetLastTempIDSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Int_Sel_Code'
      'From Int_Sel'
      'Where Text100=:GUID')
    Left = 56
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddTempIDSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Select Max(Int_Sel_Code)+1, 0, 0, 0, 0, :GUID From Int_Sel'
      ''
      ' ')
    Left = 56
    Top = 80
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelTempIDSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete'
      'From Int_Sel'
      'Where Int_Sel_Code = :Int_Sel_Code'
      '')
    Left = 56
    Top = 200
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdTempIDSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Int_Sel'
      'Set Sel1=:Sel1, Sel2=:Sel2, Sel3=:Sel3, Sel4=:Sel4,'
      '    Tag=:Tag, Text100=:Text100'
      'Where Int_Sel_Code=:Int_Sel_Code'
      ''
      ' ')
    Left = 56
    Top = 136
    ParamData = <
      item
        Name = 'Sel1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Tag'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Text100'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Select Max(Int_Sel_Code)+1, 0, 0, 0, 0, :GUID From Int_Sel'
      ''
      ' ')
    Left = 56
    Top = 264
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddWithKeySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Tag, Text100)'
      'VALUES'
      '(:Key, :Sel1, :Sel2, :Sel3, :Sel4, :Tag, :Text100)'
      ''
      ' '
      ' ')
    Left = 56
    Top = 328
    ParamData = <
      item
        Name = 'Key'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Tag'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Text100'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddWithKey5SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Sel5, Tag, Text100)'
      'VALUES'
      '(:Key, :Sel1, :Sel2, :Sel3, :Sel4, :Sel5, :Tag, :Text100)'
      ''
      ' '
      ' ')
    Left = 56
    Top = 384
    ParamData = <
      item
        Name = 'Key'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sel5'
      end
      item
        Name = 'Tag'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Text100'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
