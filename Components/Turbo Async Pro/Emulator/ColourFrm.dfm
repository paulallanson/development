object ColourForm: TColourForm
  Left = 241
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Options - Colors'
  ClientHeight = 100
  ClientWidth = 426
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
    Left = 4
    Top = 16
    Width = 56
    Height = 13
    Caption = 'ForeGround'
  end
  object Label2: TLabel
    Left = 4
    Top = 40
    Width = 58
    Height = 13
    Caption = 'Background'
  end
  object FgndCombo: TComboBox
    Left = 80
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = FgndComboChange
    Items.Strings = (
      'Black'
      'Maroon'
      'Green'
      'Olive'
      'Navy'
      'Purple'
      'Teal'
      'Gray'
      'Silver'
      'Red'
      'Lime'
      'Yellow'
      'Blue'
      'Fuchsia'
      'Aqua'
      'White')
  end
  object BgndCombo: TComboBox
    Left = 80
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = BgndComboChange
    Items.Strings = (
      'Black'
      'Maroon'
      'Green'
      'Olive'
      'Navy'
      'Purple'
      'Teal'
      'Gray'
      'Silver'
      'Red'
      'Lime'
      'Yellow'
      'Blue'
      'Fuchsia'
      'Aqua'
      'White')
  end
  object Sample: TPanel
    Left = 236
    Top = 8
    Width = 185
    Height = 45
    Caption = 'Sample'
    TabOrder = 2
  end
  object SaveBtn: TButton
    Left = 84
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = SaveBtnClick
  end
  object CancelBtn: TButton
    Left = 160
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object HelpBtn: TButton
    Left = 236
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 5
  end
end
