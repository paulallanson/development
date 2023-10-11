object PBEnqNoteFrm: TPBEnqNoteFrm
  Left = 387
  Top = 321
  BorderStyle = bsSingle
  Caption = 'Add Enquiry Note'
  ClientHeight = 177
  ClientWidth = 180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 161
    Height = 121
    Caption = 'Audience'
    Items.Strings = (
      'Customer'
      'Supplier'
      'Both')
    ParentBackground = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 144
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
