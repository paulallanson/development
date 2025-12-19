object DateSelV5Form: TDateSelV5Form
  Left = 248
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Date Select'
  ClientHeight = 238
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 0
    Width = 260
    Height = 205
    Align = alClient
    Date = 36458.000000000000000000
    TabOrder = 0
    ExplicitWidth = 219
    ExplicitHeight = 151
  end
  object Panel1: TPanel
    Left = 0
    Top = 205
    Width = 260
    Height = 33
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 151
    ExplicitWidth = 219
    DesignSize = (
      260
      33)
    object OKBitBtn: TBitBtn
      Left = 174
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 133
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
