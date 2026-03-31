object WTMaintContAppfrm: TWTMaintContAppfrm
  Left = 246
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Set Appointment'
  ClientHeight = 120
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 27
    Height = 17
    Caption = 'Date'
  end
  object Label2: TLabel
    Left = 160
    Top = 8
    Width = 28
    Height = 17
    Caption = 'Time'
  end
  object dtpckAppTime: TDateTimePicker
    Left = 160
    Top = 29
    Width = 81
    Height = 25
    Date = 37565.000000000000000000
    Time = 0.539912499996717100
    Kind = dtkTime
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 76
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 76
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object DateTimePicker: TDateTimePicker
    Left = 16
    Top = 29
    Width = 121
    Height = 25
    Date = 37568.000000000000000000
    Time = 37568.000000000000000000
    TabOrder = 3
  end
end
