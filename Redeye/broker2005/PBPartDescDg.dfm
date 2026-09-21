object PBPartDescDlg: TPBPartDescDlg
  Left = 523
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Set part description'
  ClientHeight = 214
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 161
    Shape = bsFrame
  end
  object lblDescription: TLabel
    Left = 28
    Top = 65
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object OKBtn: TButton
    Left = 79
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 159
    Top = 180
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object edtDescription: TEdit
    Left = 28
    Top = 81
    Width = 257
    Height = 25
    TabOrder = 0
  end
end
