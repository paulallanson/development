object FtpLoginForm: TFtpLoginForm
  Left = 260
  Top = 229
  BorderStyle = bsDialog
  Caption = 'FTP Login'
  ClientHeight = 193
  ClientWidth = 387
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
    Left = 156
    Top = 20
    Width = 36
    Height = 13
    Caption = 'User ID'
  end
  object Label2: TLabel
    Left = 156
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object HostsList: TListBox
    Left = 8
    Top = 12
    Width = 133
    Height = 173
    ItemHeight = 13
    TabOrder = 0
  end
  object UserIdEdit: TEdit
    Left = 224
    Top = 12
    Width = 141
    Height = 21
    TabOrder = 1
  end
  object PasswdEdit: TEdit
    Left = 224
    Top = 40
    Width = 141
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object ConnectBtn: TButton
    Left = 152
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Connect'
    Default = True
    TabOrder = 3
    OnClick = ConnectBtnClick
  end
  object CancelBtn: TButton
    Left = 227
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object HelpBtn: TButton
    Left = 302
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 5
    OnClick = HelpBtnClick
  end
end
