object STPrtMntLvlsFrm: TSTPrtMntLvlsFrm
  Left = 257
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Stock Levels'
  ClientHeight = 168
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object lblMin: TLabel
    Left = 16
    Top = 20
    Width = 90
    Height = 17
    Caption = 'Minimum Level:'
  end
  object lblMax: TLabel
    Left = 16
    Top = 52
    Width = 93
    Height = 17
    Caption = 'Maximum Level:'
  end
  object lblReOrder: TLabel
    Left = 16
    Top = 84
    Width = 84
    Height = 17
    Caption = 'Reorder Level:'
  end
  object btbtnOK: TBitBtn
    Left = 24
    Top = 123
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object edtMin: TEdit
    Left = 112
    Top = 16
    Width = 89
    Height = 25
    TabOrder = 1
    OnExit = edtMinExit
    OnKeyPress = edtReOrderKeyPress
  end
  object edtMax: TEdit
    Left = 112
    Top = 48
    Width = 89
    Height = 25
    TabOrder = 2
    OnExit = edtMaxExit
    OnKeyPress = edtReOrderKeyPress
  end
  object edtReOrder: TEdit
    Left = 112
    Top = 80
    Width = 89
    Height = 25
    TabOrder = 3
    OnExit = edtReOrderExit
    OnKeyPress = edtReOrderKeyPress
  end
  object btnCancel: TBitBtn
    Left = 112
    Top = 123
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
end
