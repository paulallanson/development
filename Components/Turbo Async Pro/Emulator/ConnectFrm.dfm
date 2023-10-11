object ConnectForm: TConnectForm
  Left = 264
  Top = 214
  BorderStyle = bsDialog
  Caption = 'Connect'
  ClientHeight = 183
  ClientWidth = 227
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
  object HostsList: TListBox
    Left = 4
    Top = 4
    Width = 133
    Height = 173
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = HostsListDblClick
  end
  object ConnectBtn: TButton
    Left = 148
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Connect'
    Default = True
    TabOrder = 1
    OnClick = ConnectBtnClick
  end
  object CancelBtn: TButton
    Left = 148
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object HelpBtn: TButton
    Left = 148
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
    OnClick = HelpBtnClick
  end
end
