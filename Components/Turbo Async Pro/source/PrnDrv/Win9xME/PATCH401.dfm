object Form1: TForm1
  Left = 242
  Top = 175
  Width = 435
  Height = 300
  Caption = 'Patch a 16-bit printer driver for use with Windows95'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 12
    Top = 12
    Width = 80
    Height = 29
    Caption = 'Select driver...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'DRV'
    Filter = '16-bit driver file|*.DRV|DLL|*.DLL|All files|*.*'
    Options = [ofFileMustExist, ofNoReadOnlyReturn]
    Title = 'Pick a driver file'
    Left = 100
    Top = 12
  end
end
