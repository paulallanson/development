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
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    ParentBackground = False
    Left = 8
    Top = 8
    Width = 161
    Height = 121
    Caption = 'Audience'
    Items.Strings = (
      'Customer'
      'Supplier'
      'Both')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
