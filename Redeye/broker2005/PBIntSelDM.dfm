object dmIntSel: TdmIntSel
  OldCreateOrder = False
  Left = 252
  Top = 105
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
        DataType = ftString
        Name = 'GUID'
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
        DataType = ftString
        Name = 'GUID'
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
        DataType = ftInteger
        Name = 'Int_Sel_Code'
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
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Tag'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Text100'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
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
        DataType = ftString
        Name = 'GUID'
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
        DataType = ftInteger
        Name = 'Key'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Tag'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Text100'
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
        DataType = ftInteger
        Name = 'Key'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sel4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Sel5'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Tag'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Text100'
        ParamType = ptInput
      end>
  end
end
