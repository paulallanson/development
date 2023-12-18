object frmpbEnvSel: TfrmpbEnvSel
  Left = 139
  Top = 130
  Caption = 'Enviroment Selection'
  ClientHeight = 147
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object DBRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 81
    Height = 65
    Caption = 'Database'
    Items.Strings = (
      'Live'
      'Test')
    ParentBackground = False
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
    Height = 65
    Caption = 'Fax System'
    Items.Strings = (
      'Server'
      'Workstation')
    ParentBackground = False
    TabOrder = 3
  end
end
