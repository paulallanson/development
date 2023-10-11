object ApxProtocolPage: TApxProtocolPage
  Left = 450
  Top = 173
  Width = 358
  Height = 300
  Caption = 'Protocol Options'
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
    Left = 12
    Top = 252
    Width = 76
    Height = 13
    Caption = 'Write fail action:'
    FocusControl = cbxWriteFailAction
  end
  object Label2: TLabel
    Left = 12
    Top = 205
    Width = 86
    Height = 13
    Caption = 'Receive directory:'
    FocusControl = edtReceiveDirectory
  end
  object Label8: TLabel
    Left = 266
    Top = 51
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = '&Status interval:'
    FocusControl = edtStatusInterval
  end
  object Label5: TLabel
    Left = 139
    Top = 51
    Width = 52
    Height = 13
    Caption = '&Finish wait:'
    FocusControl = edtFinishWait
  end
  object Label1: TLabel
    Left = 12
    Top = 51
    Width = 81
    Height = 13
    Caption = '&Handshake retry:'
    FocusControl = edtHandshakeRetry
  end
  object Label6: TLabel
    Left = 12
    Top = 29
    Width = 65
    Height = 13
    Caption = '&Protocol type:'
    FocusControl = cbxProtocol
  end
  object Bevel2: TBevel
    Left = 28
    Top = 13
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 5
    Top = 7
    Width = 43
    Height = 13
    Caption = 'General  '
  end
  object Bevel3: TBevel
    Left = 28
    Top = 168
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label7: TLabel
    Left = 5
    Top = 162
    Width = 65
    Height = 13
    Caption = 'File handling  '
  end
  object cbxWriteFailAction: TComboBox
    Left = 92
    Top = 248
    Width = 98
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Write None'
      'Write Fail'
      'Write Rename '
      'Write Anyway'
      'Write Resume')
  end
  object chkIncludeDirectory: TCheckBox
    Left = 12
    Top = 227
    Width = 229
    Height = 17
    Caption = 'Include directory information on transmit'
    TabOrder = 1
  end
  object btnReceiveDirectory: TButton
    Left = 315
    Top = 201
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = btnReceiveDirectoryClick
  end
  object edtReceiveDirectory: TEdit
    Left = 104
    Top = 201
    Width = 209
    Height = 21
    TabOrder = 3
  end
  object chkUpCaseFileNames: TCheckBox
    Left = 212
    Top = 180
    Width = 123
    Height = 17
    Caption = 'Uppercase file names'
    TabOrder = 4
  end
  object chkHonorDirectory: TCheckBox
    Left = 12
    Top = 180
    Width = 155
    Height = 17
    Caption = 'Honor directory for receive'
    TabOrder = 5
  end
  object chkAbortNoCarrier: TCheckBox
    Left = 12
    Top = 134
    Width = 140
    Height = 17
    Caption = 'Cancel on carrier loss'
    TabOrder = 6
  end
  object chkRTSLowForWrite: TCheckBox
    Left = 12
    Top = 114
    Width = 175
    Height = 17
    Caption = 'Lower RTS while writing to disk'
    TabOrder = 7
  end
  object chkProtocolStatusDisplay: TCheckBox
    Left = 12
    Top = 94
    Width = 209
    Height = 17
    Caption = 'Display protocol status during transfer'
    TabOrder = 8
  end
  object edtStatusInterval: TEdit
    Left = 266
    Top = 69
    Width = 33
    Height = 21
    TabOrder = 9
    Text = '0'
  end
  object UpDown3: TUpDown
    Left = 299
    Top = 69
    Width = 15
    Height = 21
    Associate = edtStatusInterval
    Max = 32767
    TabOrder = 10
  end
  object edtFinishWait: TEdit
    Left = 139
    Top = 69
    Width = 33
    Height = 21
    TabOrder = 11
    Text = '0'
  end
  object UpDown2: TUpDown
    Left = 172
    Top = 69
    Width = 15
    Height = 21
    Associate = edtFinishWait
    Max = 32767
    TabOrder = 12
  end
  object edtHandshakeRetry: TEdit
    Left = 12
    Top = 69
    Width = 33
    Height = 21
    TabOrder = 13
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 45
    Top = 69
    Width = 15
    Height = 21
    Associate = edtHandshakeRetry
    Max = 32767
    TabOrder = 14
  end
  object btnConfigure: TButton
    Left = 260
    Top = 25
    Width = 75
    Height = 21
    Caption = '&Configure...'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    OnClick = btnConfigureClick
  end
  object cbxProtocol: TComboBox
    Left = 80
    Top = 25
    Width = 174
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
    Items.Strings = (
      'No protocol'
      'XModem'
      'XModemCRC'
      'XModem1K'
      'XModem1KG'
      'YModem'
      'YModemG'
      'ZModem'
      'Kermit'
      'Ascii')
  end
end
