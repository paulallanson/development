object DialingForm: TDialingForm
  Left = 200
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Dialing'
  ClientHeight = 59
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CancelBtn: TButton
    Left = 72
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = CancelBtnClick
  end
end
