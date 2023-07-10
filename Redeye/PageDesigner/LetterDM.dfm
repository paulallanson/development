object dmLetter: TdmLetter
  OldCreateOrder = False
  Left = 144
  Top = 119
  Height = 479
  Width = 741
  object qryLetter: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM tb_LetterLayout'
      'WHERE f_LetterName = :Name')
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end>
  end
  object qryElement: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM tb_LetterElement'
      'WHERE f_LetterName = :Name')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end>
  end
  object qryAddLetter: TQuery
    DatabaseName = 'PB'
    RequestLive = True
    SQL.Strings = (
      'INSERT INTO tb_LetterLayout'
      
        '(f_LetterName, f_LetterType, f_Font1Name, f_Font1Size, f_Font1St' +
        'yle'
      
        ',f_Font2Name, f_Font2Size, f_Font2Style, f_Font3Name, f_Font3Siz' +
        'e'
      
        ',f_Font3Style, f_Font4Name, f_Font4Size, f_Font4Style, f_Font5Na' +
        'me'
      ',f_Font5Size, f_Font5Style, f_LetterTypeDefault'
      ',f_TabUnit, f_TabStop1, f_TabStop2 )'
      'VALUES'
      '(:LetterName, :LetterType, :Font1Name, :Font1Size, :Font1Style'
      ',:Font2Name, :Font2Size, :Font2Style, :Font3Name, :Font3Size'
      ',:Font3Style, :Font4Name, :Font4Size, :Font4Style, :Font5Name'
      ',:Font5Size, :Font5Style, :Default'
      ',:TabUnit, :TabStop1, :TabStop2 )'
      ' ')
    Left = 32
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'LetterName'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LetterType'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font1Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font1Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font1Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font2Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font2Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font2Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font3Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font3Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font3Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font4Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font4Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font4Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font5Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font5Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font5Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Default'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TabUnit'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TabStop1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TabStop2'
        ParamType = ptInput
      end>
  end
  object qryLayouts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      '')
    Left = 32
    Top = 224
  end
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    BeforeConnect = ADOConnBeforeConnect
    Left = 104
    Top = 16
  end
  object ADOAddElement: TADOQuery
    Connection = ADOConn
    Parameters = <
      item
        Name = 'LetterName'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ElementName'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Number'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontNo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontSize'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontStyle'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Printed'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PrintOrder'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Column'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Left'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Width'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Fixed'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DbData'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'BlankBefore'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'BlankAfter'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Text'
        DataType = ftMemo
        Size = -1
        Value = Null
      end
      item
        Name = 'Alignment'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'UsesTab'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2No'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2Size'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2Style'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Detailed'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO tb_LetterElement'
      '(f_LetterName, f_ElementName, f_Number ,f_FontNo'
      ',f_FontSize ,f_FontStyle ,f_Printed ,f_PrintOrder'
      ',f_Column ,f_Left ,f_Width ,f_Fixed ,f_DbData'
      ',f_BlankBefore, f_BlankAfter ,f_Text, f_Alignment, f_UsesTab'
      ',f_Font2No, f_Font2Size, f_Font2Style, f_Detailed)'
      'VALUES'
      '(:LetterName, :ElementName, :Number ,:FontNo'
      ',:FontSize ,:FontStyle ,:Printed ,:PrintOrder'
      ',:Column ,:Left ,:Width ,:Fixed ,:DbData'
      ',:BlankBefore, :BlankAfter, :Text, :Alignment, :UsesTab'
      ',:Font2No, :Font2Size, :Font2Style, :Detailed)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 64
  end
  object ADOUpdElement: TADOQuery
    Connection = ADOConn
    Parameters = <
      item
        Name = 'Number'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontNo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontSize'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FontStyle'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Printed'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PrintOrder'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Column'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Left'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Width'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Fixed'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DbData'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'BlankBefore'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'BlankAfter'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Text'
        DataType = ftMemo
        Size = -1
        Value = Null
      end
      item
        Name = 'Alignment'
        Size = -1
        Value = Null
      end
      item
        Name = 'UsesTab'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2No'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2Size'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Font2Style'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Detailed'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'EName'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE tb_LetterElement  SET'
      '   f_Number     = :Number'
      '  ,f_FontNo     = :FontNo'
      '  ,f_FontSize   = :FontSize'
      '  ,f_FontStyle  = :FontStyle'
      '  ,f_Printed    = :Printed'
      '  ,f_PrintOrder = :PrintOrder'
      '  ,f_Column     = :Column'
      '  ,f_Left       = :Left'
      '  ,f_Width      = :Width'
      '  ,f_Fixed      = :Fixed'
      '  ,f_DbData     = :DbData'
      '  ,f_BlankBefore= :BlankBefore'
      '  ,f_BlankAfter = :BlankAfter'
      '  ,f_Text       = :Text'
      '  ,f_Alignment  = :Alignment'
      '  ,f_UsesTab    = :UsesTab'
      '  ,f_Font2No    = :Font2No'
      '  ,f_Font2Size  = :Font2Size'
      '  ,f_Font2Style = :Font2Style'
      '  ,f_Detailed   = :Detailed'
      'WHERE f_LetterName = :Name AND f_ElementName = :EName'
      ' '
      ' ')
    Left = 104
    Top = 120
  end
  object qryUpdLetter: TQuery
    DatabaseName = 'PB'
    RequestLive = True
    SQL.Strings = (
      'UPDATE tb_LetterLayout SET'
      #9' f_Font1Name =   :Font1Name'
      #9',f_Font1Size =   :Font1Size'
      #9',f_Font1Style =  :Font1Style'
      #9',f_Font2Name =   :Font2Name'
      #9',f_Font2Size =   :Font2Size'
      #9',f_Font2Style =  :Font2Style'
      #9',f_Font3Name =   :Font3Name'
      #9',f_Font3Size =   :Font3Size'
      #9',f_Font3Style =  :Font3Style'
      #9',f_Font4Name =   :Font4Name'
      #9',f_Font4Size =   :Font4Size'
      #9',f_Font4Style =  :Font4Style'
      #9',f_Font5Name =   :Font5Name'
      #9',f_Font5Size =   :Font5Size'
      #9',f_Font5Style =  :Font5Style'
      '  ,f_LetterTypeDefault = :Default'
      '  ,f_TabUnit =     :TabUnit'
      '  ,f_TabStop1 =    :TabStop1'
      '  ,f_TabStop2 =    :TabStop2'
      'WHERE f_LetterName = :Name'
      ' ')
    Left = 32
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'Font1Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font1Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font1Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font2Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font2Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font2Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font3Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font3Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font3Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font4Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font4Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font4Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Font5Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font5Size'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Font5Style'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Default'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TabUnit'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TabStop1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TabStop2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end>
  end
  object qryDefaults: TQuery
    DatabaseName = 'PB'
    RequestLive = True
    SQL.Strings = (
      'UPDATE tb_LetterLayout SET f_LetterTypeDefault = '#39'N'#39
      'WHERE f_LetterType = :Type'
      ' ')
    Left = 104
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Type'
        ParamType = ptInput
      end>
  end
  object qryExportFilter: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select ExportFilter, Description'
      'from ExportFilter')
    Left = 32
    Top = 280
  end
  object qryGetExportFilter: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select ExportFilter, Description'
      'from Exportfilter'
      'where Exportfilter = :Exportfilter')
    Left = 104
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Exportfilter'
        ParamType = ptUnknown
      end>
  end
end
