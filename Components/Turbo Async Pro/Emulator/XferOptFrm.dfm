object XferOptForm: TXferOptForm
  Left = 259
  Top = 121
  BorderStyle = bsDialog
  Caption = 'File Transfer Options'
  ClientHeight = 315
  ClientWidth = 455
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
  object Label15: TLabel
    Left = 8
    Top = 256
    Width = 95
    Height = 13
    Caption = 'Desination Directory'
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 217
    Height = 237
    Caption = 'ASCII'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 76
      Height = 13
      Caption = 'Character Delay'
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 70
      Height = 13
      Caption = 'CR Translation'
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 67
      Height = 13
      Caption = 'LF Translation'
    end
    object Label4: TLabel
      Left = 8
      Top = 100
      Width = 62
      Height = 13
      Caption = 'EOF Timeout'
    end
    object Label5: TLabel
      Left = 8
      Top = 124
      Width = 50
      Height = 13
      Caption = 'Line Delay'
    end
    object Label6: TLabel
      Left = 8
      Top = 172
      Width = 46
      Height = 13
      Caption = 'Ignore ^Z'
    end
    object Label7: TLabel
      Left = 8
      Top = 148
      Width = 70
      Height = 13
      Caption = 'EOL Character'
    end
    object CharDelayEdit: TEdit
      Left = 96
      Top = 20
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object CRXlateCombo: TComboBox
      Left = 96
      Top = 44
      Width = 101
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'None'
        'Strip'
        'Add LF After')
    end
    object LFXlateCombo: TComboBox
      Left = 96
      Top = 68
      Width = 101
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'None'
        'Strip'
        'Add CR Before')
    end
    object EOFTimeoutEdit: TEdit
      Left = 96
      Top = 92
      Width = 57
      Height = 21
      TabOrder = 3
    end
    object LineDelayEdit: TEdit
      Left = 96
      Top = 116
      Width = 57
      Height = 21
      TabOrder = 4
    end
    object IgnEOFBtn: TCheckBox
      Left = 96
      Top = 168
      Width = 97
      Height = 17
      TabOrder = 6
    end
    object EOLCharEdit: TEdit
      Left = 96
      Top = 140
      Width = 57
      Height = 21
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 232
    Top = 4
    Width = 217
    Height = 101
    Caption = 'Kermit'
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 28
      Width = 70
      Height = 13
      Caption = 'Packet Length'
    end
    object Label9: TLabel
      Left = 8
      Top = 52
      Width = 70
      Height = 13
      Caption = 'Max. Windows'
    end
    object Label10: TLabel
      Left = 8
      Top = 76
      Width = 38
      Height = 13
      Caption = 'Timeout'
    end
    object PktLengthEdit: TEdit
      Left = 96
      Top = 20
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object MaxWinEdit: TEdit
      Left = 96
      Top = 44
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object KTimeoutEdit: TEdit
      Left = 96
      Top = 68
      Width = 57
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 232
    Top = 112
    Width = 217
    Height = 129
    Caption = 'Zmodem'
    TabOrder = 2
    object Label11: TLabel
      Left = 8
      Top = 20
      Width = 45
      Height = 13
      Caption = 'Overwrite'
    end
    object Label12: TLabel
      Left = 8
      Top = 44
      Width = 84
      Height = 13
      Caption = 'Use Senders Opt.'
    end
    object Label13: TLabel
      Left = 8
      Top = 72
      Width = 41
      Height = 13
      Caption = 'Recover'
    end
    object Label14: TLabel
      Left = 8
      Top = 100
      Width = 48
      Height = 13
      Caption = 'Accept All'
    end
    object OverwriteCombo: TComboBox
      Left = 96
      Top = 12
      Width = 101
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Newer or Longer'
        'Append'
        'Clobber'
        'Newer'
        'Different'
        'Protect')
    end
    object OptOverrideBtn: TCheckBox
      Left = 96
      Top = 40
      Width = 97
      Height = 17
      TabOrder = 1
    end
    object RecoverBtn: TCheckBox
      Left = 96
      Top = 68
      Width = 97
      Height = 17
      TabOrder = 2
    end
    object SkipNoFileBtn: TCheckBox
      Left = 96
      Top = 96
      Width = 97
      Height = 17
      TabOrder = 3
    end
  end
  object SaveBtn: TButton
    Left = 112
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 4
    OnClick = SaveBtnClick
  end
  object CancelBtn: TButton
    Left = 187
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object HelpBtn: TButton
    Left = 262
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 6
    OnClick = HelpBtnClick
  end
  object DestDirEdit: TEdit
    Left = 120
    Top = 248
    Width = 329
    Height = 21
    TabOrder = 3
  end
end
