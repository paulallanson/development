object PBMaintContAppfrm: TPBMaintContAppfrm
  Left = 477
  Top = 249
  BorderStyle = bsDialog
  Caption = 'Set Appointment'
  ClientHeight = 120
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object Label2: TLabel
    Left = 160
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Time'
  end
  object dtpckAppTime: TDateTimePicker
    Left = 160
    Top = 24
    Width = 81
    Height = 21
    Date = 37565.000000000000000000
    Time = 0.539912499996717100
    Kind = dtkTime
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 72
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object DateTimePicker: TDateTimePicker
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    Date = 37568.000000000000000000
    Time = 37568.000000000000000000
    TabOrder = 3
  end
end
