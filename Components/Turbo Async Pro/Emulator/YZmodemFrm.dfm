object YZmodemForm: TYZmodemForm
  Left = 274
  Top = 149
  BorderStyle = bsDialog
  Caption = 'YZmodemForm'
  ClientHeight = 94
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
    Left = 8
    Top = 16
    Width = 58
    Height = 13
    Caption = 'File Name(s)'
  end
  object FileNameEdit: TEdit
    Left = 76
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object OkBtn: TButton
    Left = 36
    Top = 48
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 111
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object HelpBtn: TButton
    Left = 186
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
    OnClick = HelpBtnClick
  end
end
