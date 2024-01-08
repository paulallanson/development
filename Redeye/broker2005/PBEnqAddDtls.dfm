object PBEnqAddDtlsFrm: TPBEnqAddDtlsFrm
  Left = 119
  Top = 107
  Caption = 'Add enquiry Additional details'
  ClientHeight = 229
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Notes:'
  end
  object AddDetailsMemo: TMemo
    Left = 16
    Top = 24
    Width = 265
    Height = 145
    MaxLength = 255
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 163
    Top = 184
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 251
    Top = 184
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object ToWhomRadioGroup: TRadioGroup
    Left = 288
    Top = 16
    Width = 193
    Height = 89
    Caption = 'To Whom'
    ItemIndex = 0
    Items.Strings = (
      'Supplier only'
      'Customer only'
      'Both Supplier and Customer')
    ParentBackground = False
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 112
    Width = 25
    Height = 25
    Hint = 'Select from Special Instructions'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
end
