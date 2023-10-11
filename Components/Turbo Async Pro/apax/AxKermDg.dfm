object ApxKermitOptions: TApxKermitOptions
  Left = 500
  Top = 93
  ActiveControl = btnOk
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Kermit Protocol Options'
  ClientHeight = 214
  ClientWidth = 287
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
  object btnOk: TButton
    Left = 128
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 206
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object rgBlockCheckMethod: TRadioGroup
    Left = 6
    Top = 4
    Width = 135
    Height = 89
    Caption = ' &Error correction '
    Items.Strings = (
      'One byte checksum'
      'Two byte checksum'
      'CRC')
    TabOrder = 2
  end
  object gbxPrefixes: TGroupBox
    Left = 147
    Top = 4
    Width = 135
    Height = 89
    Caption = ' Prefi&xes '
    TabOrder = 3
    object Label3: TLabel
      Left = 11
      Top = 18
      Width = 27
      Height = 13
      Caption = 'Hi bit:'
    end
    object Label4: TLabel
      Left = 11
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Repeat:'
    end
    object Label5: TLabel
      Left = 11
      Top = 67
      Width = 36
      Height = 13
      Caption = 'Control:'
    end
    object edtKermitHighbitPrefix: TMaskEdit
      Left = 96
      Top = 14
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 0
    end
    object edtKermitRepeatPrefix: TMaskEdit
      Left = 96
      Top = 39
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 1
    end
    object edtKermitCtlPrefix: TMaskEdit
      Left = 96
      Top = 63
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 2
    end
  end
  object gbxPadding: TGroupBox
    Left = 5
    Top = 101
    Width = 135
    Height = 73
    Caption = ' &Padding '
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 21
      Width = 31
      Height = 13
      Caption = 'Count:'
    end
    object Label2: TLabel
      Left = 11
      Top = 40
      Width = 78
      Height = 25
      AutoSize = False
      Caption = 'Character decimal value:'
      WordWrap = True
    end
    object edtKermitPadCount: TMaskEdit
      Left = 96
      Top = 17
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 0
    end
    object edtKermitPadCharacter: TMaskEdit
      Left = 96
      Top = 46
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 1
    end
  end
  object gbxPacket: TGroupBox
    Left = 146
    Top = 101
    Width = 135
    Height = 73
    Caption = ' Pa&cket '
    TabOrder = 5
    object Label6: TLabel
      Left = 11
      Top = 21
      Width = 55
      Height = 13
      Caption = 'Max length:'
    end
    object Label7: TLabel
      Left = 11
      Top = 40
      Width = 78
      Height = 26
      AutoSize = False
      Caption = 'Terminator decimal value:'
      WordWrap = True
    end
    object edtKermitMaxLen: TMaskEdit
      Left = 96
      Top = 17
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 0
    end
    object edtKermitTerminator: TMaskEdit
      Left = 96
      Top = 46
      Width = 30
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 1
    end
  end
end
