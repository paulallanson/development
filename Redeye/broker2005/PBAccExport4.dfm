object PBAccExport4Frm: TPBAccExport4Frm
  Left = 297
  Top = 173
  Caption = 'Export & Import Wizard'
  ClientHeight = 293
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 105
    TabOrder = 1
    object RecordMemo: TMemo
      Left = 8
      Top = 13
      Width = 305
      Height = 84
      Lines.Strings = (
        'RecordMemo')
      TabOrder = 0
    end
  end
end
