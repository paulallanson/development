object DateSelV5Form: TDateSelV5Form
  Left = 248
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Date Select'
  ClientHeight = 193
  ClientWidth = 225
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
    Width = 225
    Height = 160
    Align = alClient
    Date = 36458.000000000000000000
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 160
    Width = 225
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      225
      33)
    object OKBitBtn: TBitBtn
      Left = 145
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object CancelBitBtn: TBitBtn
      Left = 6
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
