object DateSelV5Form: TDateSelV5Form
  Left = 248
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Date Select'
  ClientHeight = 192
  ClientWidth = 187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 0
    Width = 191
    Height = 154
    Date = 36458.000000000000000000
    TabOrder = 0
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 112
    Top = 160
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
end
