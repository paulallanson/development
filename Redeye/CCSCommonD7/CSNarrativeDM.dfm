object dmNarrative: TdmNarrative
  OldCreateOrder = False
  Left = 263
  Top = 105
  Height = 540
  Width = 443
  object qryReserveSlot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Narrative_Line'
      
        '  (Narrative, Narrative_Line, Narrative_Text, Narrative_Line_Upd' +
        'ated)'
      '  SELECT MAX(Narrative)+1, 1, :GUID, '#39'N'#39' FROM Narrative_Line'
      ' '
      ' ')
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetReservedSlot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM narrative_line '
      'WHERE narrative_Text = :GUID')
    Left = 56
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Narrative_Line WHERE Narrative = :Narrative')
    Left = 56
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptInput
      end>
  end
  object qryUpdateLine1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Narrative_Line'
      'SET Narrative_Text = :Text, Narrative_Line_Updated = :Updated'
      'WHERE Narrative = :Narrative AND Narrative_Line = 1')
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'Text'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Updated'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptInput
      end>
  end
  object qryAddLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Narrative_Line'
      
        '(Narrative, Narrative_Line, Narrative_Text, Narrative_Line_Updat' +
        'ed)'
      'VALUES'
      '(:Narrative, :Line, :Text, :Updated)')
    Left = 56
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Text'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Updated'
        ParamType = ptInput
      end>
  end
  object qryReadNarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Narrative_Line'
      'WHERE Narrative = :Narrative'
      'order by Narrative_Line')
    Left = 56
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 160
    Top = 16
  end
end
