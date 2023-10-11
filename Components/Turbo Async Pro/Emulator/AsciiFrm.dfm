object AsciiForm: TAsciiForm
  Left = 445
  Top = 319
  BorderStyle = bsDialog
  Caption = 'AsciiForm'
  ClientHeight = 113
  ClientWidth = 252
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
    Left = 8
    Top = 16
    Width = 47
    Height = 13
    Caption = 'File Name'
  end
  object FileNameEdit: TEdit
    Left = 80
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object OkBtn: TButton
    Left = 16
    Top = 76
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 91
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object HelpBtn: TButton
    Left = 166
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
    OnClick = HelpBtnClick
  end
  object XlateBtn: TCheckBox
    Left = 76
    Top = 48
    Width = 153
    Height = 17
    Caption = 'Apply UNIX file translations'
    TabOrder = 4
  end
end
