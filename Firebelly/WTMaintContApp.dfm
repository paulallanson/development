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
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
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
    Date = 37565.539912500000000000
    Time = 37565.539912500000000000
    Kind = dtkTime
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
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
