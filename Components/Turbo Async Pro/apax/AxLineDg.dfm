object ApxLineDlg: TApxLineDlg
  Left = 385
  Top = 495
  ActiveControl = cbxBaudRate
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Direct to Com Port'
  ClientHeight = 264
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 28
    Top = 13
    Width = 274
    Height = 4
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 5
    Top = 7
    Width = 89
    Height = 13
    Caption = 'Port configuration  '
  end
  object Label4: TLabel
    Left = 12
    Top = 29
    Width = 49
    Height = 13
    Caption = '&Baud rate:'
    FocusControl = cbxBaudRate
  end
  object Label5: TLabel
    Left = 12
    Top = 55
    Width = 29
    Height = 13
    Caption = '&Parity:'
    FocusControl = cbxParity
  end
  object Label6: TLabel
    Left = 164
    Top = 29
    Width = 45
    Height = 13
    Caption = '&Data bits:'
    FocusControl = cbxDataBits
  end
  object Label7: TLabel
    Left = 164
    Top = 55
    Width = 44
    Height = 13
    Caption = '&Stop bits:'
    FocusControl = cbxStopBits
  end
  object Bevel2: TBevel
    Left = 28
    Top = 91
    Width = 274
    Height = 4
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 5
    Top = 85
    Width = 63
    Height = 13
    Caption = 'Flow control  '
  end
  object Label1: TLabel
    Left = 19
    Top = 198
    Width = 46
    Height = 13
    Caption = '&Xon char:'
    FocusControl = edtXonChar
  end
  object Label2: TLabel
    Left = 164
    Top = 198
    Width = 46
    Height = 13
    Caption = 'Xo&ff char:'
    FocusControl = edtXoffChar
  end
  object Bevel3: TBevel
    Left = 28
    Top = 109
    Width = 274
    Height = 4
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 12
    Top = 103
    Width = 52
    Height = 13
    Caption = 'Hardware  '
  end
  object Bevel4: TBevel
    Left = 28
    Top = 164
    Width = 274
    Height = 4
    Shape = bsTopLine
  end
  object Label10: TLabel
    Left = 12
    Top = 158
    Width = 48
    Height = 13
    Caption = 'Software  '
  end
  object btnOk: TButton
    Left = 139
    Top = 229
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 12
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 219
    Top = 229
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 13
    OnClick = btnCancelClick
  end
  object cbxBaudRate: TComboBox
    Left = 69
    Top = 25
    Width = 75
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbxBaudRateChange
    Items.Strings = (
      '300'
      '600'
      '1200'
      '2400'
      '4800'
      '9600'
      '19200'
      '38400'
      '57600'
      '115200')
  end
  object cbxParity: TComboBox
    Left = 69
    Top = 51
    Width = 75
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'None'
      'Odd'
      'Even'
      'Mark'
      'Space')
  end
  object cbxDataBits: TComboBox
    Left = 221
    Top = 25
    Width = 75
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      '8'
      '7'
      '6'
      '5')
  end
  object cbxStopBits: TComboBox
    Left = 221
    Top = 51
    Width = 75
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      '1'
      '2')
  end
  object chkUseDTR: TCheckBox
    Left = 19
    Top = 119
    Width = 73
    Height = 17
    Caption = 'Use D&TR'
    TabOrder = 4
  end
  object chkUseRTS: TCheckBox
    Left = 164
    Top = 119
    Width = 73
    Height = 17
    Caption = 'Use &RTS'
    TabOrder = 5
  end
  object chkSWTransmit: TCheckBox
    Left = 19
    Top = 174
    Width = 105
    Height = 17
    Caption = 'Software tr&ansmit'
    TabOrder = 8
  end
  object chkSWReceive: TCheckBox
    Left = 164
    Top = 174
    Width = 105
    Height = 17
    Caption = 'Soft&ware receive'
    TabOrder = 9
  end
  object chkRequireDSR: TCheckBox
    Left = 19
    Top = 138
    Width = 89
    Height = 17
    Caption = 'R&equire DSR'
    TabOrder = 6
  end
  object chkRequireCTS: TCheckBox
    Left = 164
    Top = 138
    Width = 89
    Height = 17
    Caption = 'Require &CTS'
    TabOrder = 7
  end
  object edtXonChar: TEdit
    Left = 75
    Top = 194
    Width = 25
    Height = 21
    TabOrder = 10
  end
  object edtXoffChar: TEdit
    Left = 216
    Top = 194
    Width = 25
    Height = 21
    TabOrder = 11
  end
end
