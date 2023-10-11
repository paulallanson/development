object ApxDevicePage: TApxDevicePage
  Left = 724
  Top = 294
  Width = 358
  Height = 310
  Caption = 'Device Configuration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Tag = 3
    Left = 225
    Top = 258
    Width = 73
    Height = 13
    Caption = 'Answer on r&ing:'
    FocusControl = edtAnswerOnRing
  end
  object Label6: TLabel
    Tag = 3
    Left = 116
    Top = 258
    Width = 50
    Height = 13
    Caption = 'Retry &wait:'
    FocusControl = edtTapiRetryWait
  end
  object Label1: TLabel
    Tag = 3
    Left = 12
    Top = 257
    Width = 38
    Height = 13
    Caption = '&Redials:'
    FocusControl = edtMaxAttempts
  end
  object Label2: TLabel
    Tag = 3
    Left = 12
    Top = 206
    Width = 62
    Height = 13
    Caption = 'TAPI d&evice:'
  end
  object Label5: TLabel
    Tag = 2
    Left = 12
    Top = 142
    Width = 22
    Height = 13
    Caption = 'P&ort:'
    FocusControl = edtWinsockPort
  end
  object Label4: TLabel
    Tag = 2
    Left = 12
    Top = 116
    Width = 41
    Height = 13
    Caption = '&Address:'
    FocusControl = edtWinsockAddress
  end
  object Label10: TLabel
    Tag = 1
    Left = 12
    Top = 52
    Width = 62
    Height = 13
    Caption = 'Com &number:'
    FocusControl = cbxComNumber
  end
  object Bevel3: TBevel
    Left = 28
    Top = 13
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Bevel4: TBevel
    Left = 28
    Top = 83
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Bevel5: TBevel
    Left = 28
    Top = 172
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label7: TLabel
    Left = 5
    Top = 7
    Width = 79
    Height = 13
    Caption = 'Direct settings    '
  end
  object Label8: TLabel
    Left = 5
    Top = 77
    Width = 90
    Height = 13
    Caption = 'Winsock settings   '
  end
  object Label9: TLabel
    Left = 5
    Top = 166
    Width = 66
    Height = 13
    Caption = 'TAPI settings '
  end
  object edtAnswerOnRing: TEdit
    Tag = 3
    Left = 302
    Top = 254
    Width = 25
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object UpDown3: TUpDown
    Tag = 3
    Left = 327
    Top = 254
    Width = 15
    Height = 21
    Associate = edtAnswerOnRing
    Max = 32767
    TabOrder = 1
  end
  object edtTapiRetryWait: TEdit
    Tag = 3
    Left = 170
    Top = 254
    Width = 25
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object UpDown2: TUpDown
    Tag = 3
    Left = 195
    Top = 254
    Width = 15
    Height = 21
    Associate = edtTapiRetryWait
    Max = 32767
    TabOrder = 3
  end
  object edtMaxAttempts: TEdit
    Tag = 3
    Left = 53
    Top = 253
    Width = 25
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object UpDown1: TUpDown
    Tag = 3
    Left = 78
    Top = 253
    Width = 15
    Height = 21
    Associate = edtMaxAttempts
    Max = 32767
    TabOrder = 5
  end
  object btnConfigure: TButton
    Tag = 3
    Left = 272
    Top = 221
    Width = 70
    Height = 21
    Caption = 'Confi&gure...'
    TabOrder = 6
  end
  object btnSelectedDevice: TButton
    Tag = 3
    Left = 246
    Top = 221
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 7
    OnClick = btnSelectedDeviceClick
  end
  object edtSelectedDevice: TEdit
    Tag = 3
    Left = 12
    Top = 221
    Width = 233
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object chkEnableVoice: TCheckBox
    Tag = 3
    Left = 128
    Top = 184
    Width = 113
    Height = 17
    Caption = 'Enable &voice'
    TabOrder = 9
  end
  object rbTapi: TRadioButton
    Tag = 3
    Left = 16
    Top = 184
    Width = 113
    Height = 17
    Caption = 'Use &TAPI'
    TabOrder = 10
    OnClick = rbDirectClick
  end
  object pnlWinsock: TPanel
    Tag = 2
    Left = 176
    Top = 140
    Width = 141
    Height = 17
    BevelOuter = bvNone
    TabOrder = 11
    object rbtnWsClient: TRadioButton
      Tag = 2
      Left = 0
      Top = 0
      Width = 49
      Height = 17
      Caption = 'C&lient'
      TabOrder = 0
    end
    object rbtnWsServer: TRadioButton
      Tag = 2
      Left = 72
      Top = 0
      Width = 65
      Height = 17
      Caption = '&Server'
      TabOrder = 1
    end
  end
  object edtWinsockPort: TEdit
    Tag = 2
    Left = 57
    Top = 138
    Width = 73
    Height = 21
    TabOrder = 12
  end
  object edtWinsockAddress: TEdit
    Tag = 2
    Left = 57
    Top = 112
    Width = 283
    Height = 21
    TabOrder = 13
  end
  object rbWinsock: TRadioButton
    Tag = 2
    Left = 12
    Top = 95
    Width = 113
    Height = 17
    Caption = 'Use &Winsock'
    TabOrder = 14
    OnClick = rbDirectClick
  end
  object btnLineSettings: TButton
    Tag = 1
    Left = 176
    Top = 46
    Width = 149
    Height = 25
    Hint = 'Line Settings'
    Caption = '&Configure Line Settings...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = btnLineSettingsClick
  end
  object cbxComNumber: TComboBox
    Tag = 1
    Left = 82
    Top = 48
    Width = 51
    Height = 21
    ItemHeight = 13
    TabOrder = 16
  end
  object chkPromptForPort: TCheckBox
    Tag = 1
    Left = 176
    Top = 25
    Width = 169
    Height = 17
    Caption = '&Prompt User for Port Number'
    TabOrder = 17
  end
  object rbDirect: TRadioButton
    Tag = 1
    Left = 12
    Top = 25
    Width = 157
    Height = 17
    Caption = 'Use &direct port access'
    TabOrder = 18
    OnClick = rbDirectClick
  end
  object chkFilterTapiDevices: TCheckBox
    Tag = 3
    Left = 232
    Top = 184
    Width = 113
    Height = 17
    Caption = '&Filter TAPI devices'
    TabOrder = 19
    OnClick = chkFilterTapiDevicesClick
  end
end
