object HostsEditForm: THostsEditForm
  Left = 141
  Top = 411
  BorderStyle = bsDialog
  Caption = 'Configure Hosts'
  ClientHeight = 267
  ClientWidth = 327
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
  object HostNameLbl: TLabel
    Left = 8
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Host Name'
  end
  object IPAddressLbl: TLabel
    Left = 8
    Top = 40
    Width = 38
    Height = 13
    Caption = 'Address'
  end
  object SerialDevLbl: TLabel
    Left = 8
    Top = 88
    Width = 34
    Height = 13
    Caption = 'Device'
  end
  object TCPPortLbl: TLabel
    Left = 8
    Top = 64
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object BaudLbl: TLabel
    Left = 8
    Top = 112
    Width = 54
    Height = 13
    Caption = 'Line Speed'
  end
  object DataBitsLbl: TLabel
    Left = 8
    Top = 136
    Width = 43
    Height = 13
    Caption = 'Data Bits'
  end
  object ParityLbl: TLabel
    Left = 8
    Top = 160
    Width = 26
    Height = 13
    Caption = 'Parity'
  end
  object StopBitsLbl: TLabel
    Left = 8
    Top = 184
    Width = 42
    Height = 13
    Caption = 'Stop Bits'
  end
  object PhoneLbl: TLabel
    Left = 8
    Top = 208
    Width = 31
    Height = 13
    Caption = 'Phone'
  end
  object HostNameEdit: TEdit
    Left = 76
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object IPAddressEdit: TEdit
    Left = 76
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object TCPPortEdit: TEdit
    Left = 76
    Top = 56
    Width = 37
    Height = 21
    TabOrder = 2
  end
  object SerialDevCombo: TComboBox
    Left = 76
    Top = 80
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object ConnectTypeBtn: TRadioGroup
    Left = 240
    Top = 4
    Width = 81
    Height = 57
    Caption = 'Connection'
    ItemIndex = 0
    Items.Strings = (
      'Telnet'
      'Serial')
    TabOrder = 9
    OnClick = ConnectTypeBtnClick
  end
  object SaveBtn: TButton
    Left = 52
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 10
    OnClick = SaveBtnClick
  end
  object CancelBtn: TButton
    Left = 127
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 11
  end
  object HelpBtn: TButton
    Left = 202
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 12
    OnClick = HelpBtnClick
  end
  object BaudCombo: TComboBox
    Left = 76
    Top = 104
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      '300'
      '1200'
      '2400'
      '4800'
      '9600'
      '19200'
      '38400'
      '57600'
      '115200')
  end
  object DataBitsCombo: TComboBox
    Left = 76
    Top = 128
    Width = 45
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      '7'
      '8')
  end
  object ParityCombo: TComboBox
    Left = 76
    Top = 152
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'None'
      'Odd'
      'Even'
      'Mark'
      'Space')
  end
  object StopBitsCombo: TComboBox
    Left = 76
    Top = 176
    Width = 45
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    Items.Strings = (
      '1'
      '2')
  end
  object PhoneEdit: TEdit
    Left = 76
    Top = 200
    Width = 153
    Height = 21
    TabOrder = 8
  end
end
