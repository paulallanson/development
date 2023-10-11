object ApxAsciiOptions: TApxAsciiOptions
  Left = 500
  Top = 93
  ActiveControl = btnOk
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Ascii Protocol Options'
  ClientHeight = 201
  ClientWidth = 392
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
    Left = 224
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 310
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object gbxDelays: TGroupBox
    Left = 8
    Top = 120
    Width = 377
    Height = 41
    Caption = ' &Delays '
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 127
      Height = 13
      Caption = 'Delay after character (MS):'
      FocusControl = edtAsciiCharDelay
    end
    object Label2: TLabel
      Left = 227
      Top = 18
      Width = 98
      Height = 13
      Caption = 'Delay after line (MS):'
      FocusControl = edtAsciiLineDelay
    end
    object edtAsciiCharDelay: TMaskEdit
      Left = 147
      Top = 14
      Width = 33
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 0
    end
    object edtAsciiLineDelay: TMaskEdit
      Left = 331
      Top = 14
      Width = 33
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 1
    end
  end
  object rgAsciiCRTranslation: TRadioGroup
    Left = 8
    Top = 8
    Width = 120
    Height = 110
    Caption = '&CR handling'
    Items.Strings = (
      'none'
      'Strip CR'
      'Add LF after')
    TabOrder = 3
  end
  object rgAsciiLFTranslation: TRadioGroup
    Left = 136
    Top = 8
    Width = 120
    Height = 110
    Caption = '&LF handling'
    Items.Strings = (
      'none'
      'Strip LF'
      'Add CR before')
    TabOrder = 4
  end
  object gbxTerminators1: TGroupBox
    Left = 264
    Top = 8
    Width = 123
    Height = 110
    Caption = '&Terminators'
    TabOrder = 5
    object Label3: TLabel
      Left = 9
      Top = 23
      Width = 72
      Height = 13
      Caption = 'EOL character:'
    end
    object Label4: TLabel
      Left = 8
      Top = 80
      Width = 63
      Height = 13
      Caption = 'Timeout (MS)'
    end
    object edtAsciiEOLChar: TMaskEdit
      Left = 84
      Top = 18
      Width = 33
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 0
    end
    object chkAsciiSuppressCtrlZ: TCheckBox
      Left = 9
      Top = 47
      Width = 97
      Height = 17
      Caption = 'Stop on Ctrl-Z'
      TabOrder = 1
    end
    object edtAsciiEOFTimeout: TMaskEdit
      Left = 79
      Top = 75
      Width = 33
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 2
    end
  end
end
