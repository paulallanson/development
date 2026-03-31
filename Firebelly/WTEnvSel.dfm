object frmWTEnvSel: TfrmWTEnvSel
  Left = 139
  Top = 130
  Caption = 'Enviroment Selection'
  ClientHeight = 145
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 17
  object DBRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 81
    Height = 67
    Caption = 'Database'
    Items.Strings = (
      'Live'
      'Test')
    TabOrder = 0
  end
  object CancelBitBtn: TBitBtn
    Left = 152
    Top = 104
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 72
    Top = 104
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object FaxSystemRadioGroup: TRadioGroup
    Left = 96
    Top = 8
    Width = 129
    Height = 67
    Caption = 'Fax System'
    Items.Strings = (
      'Server'
      'Workstation')
    TabOrder = 3
  end
end
