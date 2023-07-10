object STPrtMntLvlsFrm: TSTPrtMntLvlsFrm
  Left = 257
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Stock Levels'
  ClientHeight = 147
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMin: TLabel
    Left = 16
    Top = 20
    Width = 73
    Height = 13
    Caption = 'Minimum Level:'
  end
  object lblMax: TLabel
    Left = 16
    Top = 52
    Width = 76
    Height = 13
    Caption = 'Maximum Level:'
  end
  object lblReOrder: TLabel
    Left = 16
    Top = 84
    Width = 70
    Height = 13
    Caption = 'Reorder Level:'
  end
  object btbtnOK: TBitBtn
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object edtMin: TEdit
    Left = 112
    Top = 16
    Width = 89
    Height = 21
    TabOrder = 1
    OnExit = edtMinExit
    OnKeyPress = edtReOrderKeyPress
  end
  object edtMax: TEdit
    Left = 112
    Top = 48
    Width = 89
    Height = 21
    TabOrder = 2
    OnExit = edtMaxExit
    OnKeyPress = edtReOrderKeyPress
  end
  object edtReOrder: TEdit
    Left = 112
    Top = 80
    Width = 89
    Height = 21
    TabOrder = 3
    OnExit = edtReOrderExit
    OnKeyPress = edtReOrderKeyPress
  end
  object btnCancel: TBitBtn
    Left = 112
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
