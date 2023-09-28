object PBAccExport2Frm: TPBAccExport2Frm
  Left = 225
  Top = 127
  Caption = 'Export & Import Wizard'
  ClientHeight = 281
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object BackBitBtn: TBitBtn
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 0
    OnClick = BackBitBtnClick
  end
  object UpdateBitBtn: TBitBtn
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 1
    OnClick = UpdateBitBtnClick
  end
  object ResetBitBtn: TBitBtn
    Left = 176
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = ResetBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBitBtnClick
  end
end
