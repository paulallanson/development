object ApxXYModemOptions: TApxXYModemOptions
  Left = 500
  Top = 93
  ActiveControl = btnOk
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'X/YModem Options'
  ClientHeight = 102
  ClientWidth = 211
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
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 126
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 197
    Height = 57
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 22
      Width = 104
      Height = 13
      Caption = 'XYModemBlockWait: '
    end
    object edtXYModemBlockWait: TEdit
      Left = 136
      Top = 18
      Width = 49
      Height = 21
      TabOrder = 0
    end
  end
end
