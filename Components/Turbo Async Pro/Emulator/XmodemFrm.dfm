object XmodemForm: TXmodemForm
  Left = 113
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Xmodem'
  ClientHeight = 132
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 28
    Width = 47
    Height = 13
    Caption = 'File Name'
  end
  object FileNameEdit: TEdit
    Left = 16
    Top = 48
    Width = 141
    Height = 21
    TabOrder = 0
  end
  object ProtocolBtn: TRadioGroup
    Left = 168
    Top = 8
    Width = 109
    Height = 77
    Caption = 'Protocol'
    ItemIndex = 0
    Items.Strings = (
      'Xmodem'
      'Xmodem CRC'
      'Xmodem 1K')
    TabOrder = 1
  end
  object OkBtn: TButton
    Left = 28
    Top = 100
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 103
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object HelpBtn: TButton
    Left = 178
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = HelpBtnClick
  end
end
