object TapiDeviceSelectionForm: TTapiDeviceSelectionForm
  Left = 545
  Top = 497
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tapi Device Selection'
  ClientHeight = 135
  ClientWidth = 299
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 89
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 71
      Height = 13
      Caption = 'Phone Number'
    end
    object cbxTapiDevices: TComboBox
      Left = 16
      Top = 16
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object edtPhoneNumber: TEdit
      Left = 96
      Top = 48
      Width = 169
      Height = 21
      TabOrder = 1
    end
  end
  object btnCancel: TButton
    Left = 216
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 136
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
end
