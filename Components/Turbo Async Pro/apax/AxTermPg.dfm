object ApxTerminalPage: TApxTerminalPage
  Left = 445
  Top = 240
  Width = 358
  Height = 300
  Caption = 'Terminal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 100
    Top = 247
    Width = 30
    Height = 13
    Caption = 'Row&s:'
    FocusControl = edtScrollbackRows
  end
  object Label6: TLabel
    Left = 225
    Top = 198
    Width = 54
    Height = 13
    Caption = '&Time delay:'
    FocusControl = edtTerminalLazyTimeDelay
  end
  object Label5: TLabel
    Left = 99
    Top = 198
    Width = 52
    Height = 13
    Caption = '&Byte delay:'
    FocusControl = edtTerminalLazyByteDelay
  end
  object Label8: TLabel
    Left = 133
    Top = 146
    Width = 48
    Height = 13
    Caption = '&File name:'
    FocusControl = edtCaptureFile
  end
  object Label7: TLabel
    Left = 15
    Top = 146
    Width = 30
    Height = 13
    Caption = '&Mode:'
    FocusControl = cbxCaptureMode
  end
  object Label1: TLabel
    Left = 136
    Top = 76
    Width = 49
    Height = 13
    Caption = '&Emulation:'
    FocusControl = cbxEmulation
  end
  object Label10: TLabel
    Left = 76
    Top = 76
    Width = 43
    Height = 13
    Caption = '&Columns:'
    FocusControl = edtColumns
  end
  object Label9: TLabel
    Left = 15
    Top = 76
    Width = 30
    Height = 13
    Caption = '&Rows:'
    FocusControl = edtRows
  end
  object Bevel1: TBevel
    Left = 28
    Top = 13
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 5
    Top = 7
    Width = 43
    Height = 13
    Caption = 'General  '
  end
  object Bevel2: TBevel
    Left = 27
    Top = 130
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 5
    Top = 124
    Width = 43
    Height = 13
    Caption = 'Capture  '
  end
  object Bevel3: TBevel
    Left = 27
    Top = 182
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label11: TLabel
    Left = 5
    Top = 176
    Width = 63
    Height = 13
    Caption = 'Lazy display  '
  end
  object Bevel4: TBevel
    Left = 27
    Top = 232
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label12: TLabel
    Left = 5
    Top = 226
    Width = 56
    Height = 13
    Caption = 'Scrollback  '
  end
  object edtScrollbackRows: TMaskEdit
    Left = 136
    Top = 243
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 0
    Text = '   0'
  end
  object UpDown5: TUpDown
    Left = 169
    Top = 243
    Width = 15
    Height = 21
    Associate = edtScrollbackRows
    Max = 32767
    TabOrder = 1
  end
  object chkScrollBackEnabled: TCheckBox
    Left = 15
    Top = 245
    Width = 70
    Height = 17
    Caption = 'Enable&d'
    TabOrder = 2
  end
  object edtTerminalLazyTimeDelay: TMaskEdit
    Left = 284
    Top = 194
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 3
    Text = '   0'
  end
  object UpDown4: TUpDown
    Left = 317
    Top = 194
    Width = 15
    Height = 21
    Associate = edtTerminalLazyTimeDelay
    Max = 32767
    TabOrder = 4
  end
  object edtTerminalLazyByteDelay: TMaskEdit
    Left = 156
    Top = 194
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 5
    Text = '   0'
  end
  object UpDown3: TUpDown
    Left = 189
    Top = 194
    Width = 15
    Height = 21
    Associate = edtTerminalLazyByteDelay
    Max = 32767
    TabOrder = 6
  end
  object chkTerminalUseLazyDisplay: TCheckBox
    Left = 15
    Top = 196
    Width = 63
    Height = 17
    Caption = 'E&nabled'
    TabOrder = 7
  end
  object edtCaptureFile: TEdit
    Left = 184
    Top = 142
    Width = 149
    Height = 21
    TabOrder = 8
  end
  object cbxCaptureMode: TComboBox
    Left = 50
    Top = 142
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Items.Strings = (
      'Off'
      'On'
      'Append')
  end
  object pnlColor: TPanel
    Left = 311
    Top = 94
    Width = 20
    Height = 20
    BevelOuter = bvLowered
    TabOrder = 10
  end
  object btnColor: TButton
    Left = 258
    Top = 93
    Width = 49
    Height = 22
    Caption = 'C&olor...'
    TabOrder = 11
    OnClick = btnColorClick
  end
  object cbxEmulation: TComboBox
    Left = 136
    Top = 94
    Width = 115
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      'TTY'
      'VT100')
  end
  object edtColumns: TMaskEdit
    Left = 76
    Top = 94
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 13
    Text = '   0'
  end
  object UpDown2: TUpDown
    Left = 109
    Top = 94
    Width = 15
    Height = 21
    Associate = edtColumns
    Max = 32767
    TabOrder = 14
  end
  object edtRows: TMaskEdit
    Left = 15
    Top = 94
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 15
    Text = '   0'
  end
  object UpDown1: TUpDown
    Left = 48
    Top = 94
    Width = 15
    Height = 21
    Associate = edtRows
    Max = 32767
    TabOrder = 16
  end
  object chkTerminalWantAllKeys: TCheckBox
    Left = 133
    Top = 44
    Width = 89
    Height = 17
    Caption = '&Want all keys'
    TabOrder = 17
  end
  object chkTerminalHalfDuplex: TCheckBox
    Left = 15
    Top = 44
    Width = 81
    Height = 17
    Caption = 'Half duple&x'
    TabOrder = 18
  end
  object chkTerminalActive: TCheckBox
    Left = 133
    Top = 25
    Width = 57
    Height = 17
    Caption = '&Active'
    TabOrder = 19
  end
  object chkVisible: TCheckBox
    Left = 15
    Top = 25
    Width = 73
    Height = 17
    Caption = '&Visible'
    TabOrder = 20
  end
  object ColorDialog1: TColorDialog
    Left = 304
    Top = 65534
  end
end
