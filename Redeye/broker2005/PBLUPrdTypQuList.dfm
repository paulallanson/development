object PBLUPrdTypQuListfrm: TPBLUPrdTypQuListfrm
  Left = 265
  Top = 106
  ActiveControl = memoList
  BorderStyle = bsDialog
  Caption = 'Question List'
  ClientHeight = 270
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 217
    Shape = bsFrame
  end
  object OKBtn: TButton
    Left = 79
    Top = 236
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 159
    Top = 236
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object memoList: TMemo
    Left = 10
    Top = 10
    Width = 291
    Height = 212
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
