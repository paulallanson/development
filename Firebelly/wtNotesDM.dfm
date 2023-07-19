object dtmdlNotes: TdtmdlNotes
  Height = 413
  Width = 409
  object qryReserveslot: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Notes'
      '  (Notes_Code, Notes_Line, Notes_Text, Notes_Line_Updated)'
      'VALUES'
      '  (:Notes_Code,1,'#39'.'#39','#39'N'#39')')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryGetReservedSlot: TFDQuery
    ConnectionName = 'wt'
    Left = 40
    Top = 56
  end
  object qryReadNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT * FROM Notes'
      'WHERE Notes_Code = :Notes_Code'
      'order by Notes_Line')
    Left = 40
    Top = 264
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 40
    Top = 320
  end
  object qryDelete: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'DELETE FROM Notes WHERE Notes_code = :Notes_code')
    Left = 40
    Top = 104
    ParamData = <
      item
        Name = 'Notes_code'
      end>
  end
  object qryUpdateLine1: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Notes'
      
        'SET Notes_Text = :Notes_Text, Notes_Line_Updated = :Notes_Line_U' +
        'pdated'
      'WHERE Notes_code = :Notes_code AND Notes_Line = 1')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'Notes_Text'
      end
      item
        Name = 'Notes_Line_Updated'
      end
      item
        Name = 'Notes_code'
      end>
  end
  object qryAddLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Notes'
      '(Notes_Code, Notes_Line, Notes_Text, Notes_Line_Updated)'
      'VALUES'
      '(:Notes_Code, :Notes_Line, :Notes_Text, :Notes_Line_Updated)')
    Left = 40
    Top = 208
    ParamData = <
      item
        Name = 'Notes_Code'
      end
      item
        Name = 'Notes_Line'
      end
      item
        Name = 'Notes_Text'
      end
      item
        Name = 'Notes_Line_Updated'
      end>
  end
  object qryGetNextSlot: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(notes_code) as Last_Notes_Code'
      'from notes')
    Left = 120
    Top = 8
  end
  object qryReserveNotesSlot: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Notes'
      '  (Notes_Code, Notes_Line, Notes_Text, Notes_Line_Updated)'
      '  SELECT MAX(Notes_Code)+1, 1, :GUID, '#39'N'#39' FROM Notes'
      ' '
      ' ')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetReservedNotesSlot: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT * FROM Notes '
      'WHERE Notes_Text = :GUID')
    Left = 216
    Top = 64
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
end
