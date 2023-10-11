object FtpProgressForm: TFtpProgressForm
  Left = 200
  Top = 108
  Width = 287
  Height = 112
  Caption = 'Show Progress'
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
  object ProgressBar: TProgressBar
    Left = 16
    Top = 12
    Width = 257
    Height = 16
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 100
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
end
