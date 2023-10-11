object PBEnqLineTmp: TPBEnqLineTmp
  Left = 163
  Top = 113
  Caption = 'PBEnqLineTmp'
  ClientHeight = 266
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object PartGrid: TStringGrid
    Left = 24
    Top = 8
    Width = 209
    Height = 57
    ColCount = 14
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object AddGrid: TStringGrid
    Left = 248
    Top = 8
    Width = 185
    Height = 57
    ColCount = 3
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    RowHeights = (
      24)
  end
  object CapGrid: TStringGrid
    Left = 24
    Top = 72
    Width = 209
    Height = 57
    ColCount = 4
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    ColWidths = (
      64
      64
      64
      64)
  end
  object QuestionGrid: TStringGrid
    Left = 248
    Top = 72
    Width = 185
    Height = 57
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
    RowHeights = (
      24)
  end
  object SupplierGrid: TStringGrid
    Left = 24
    Top = 136
    Width = 209
    Height = 57
    ColCount = 6
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
  end
  object NotesMemo: TMemo
    Left = 24
    Top = 200
    Width = 393
    Height = 57
    TabOrder = 5
  end
  object OptionsGrid: TStringGrid
    Left = 248
    Top = 136
    Width = 185
    Height = 57
    ColCount = 4
    RowCount = 1
    FixedRows = 0
    TabOrder = 6
    ColWidths = (
      64
      64
      64
      64)
  end
end
