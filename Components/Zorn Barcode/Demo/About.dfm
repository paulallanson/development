object AboutBox: TAboutBox
  Left = 245
  Top = 108
  BorderIcons = []
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'About Zorn Software Barcode components'
  ClientHeight = 204
  ClientWidth = 305
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 48
    Top = 128
    Width = 203
    Height = 20
    Cursor = crHandPoint
    Caption = 'http://www.zornsoftware.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 24
    Top = 8
    Width = 4
    Height = 20
  end
  object OKBtn: TButton
    Left = 112
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 305
    Height = 121
    TabStop = False
    Align = alTop
    BorderStyle = bsNone
    Color = clWhite
    Lines.Strings = (
      'This free demo application was created '
      'using Delphi and the ZBarcode component '
      'by Zorn Software.'
      'Full source code is supplied with the '
      'component code.'
      'For more information, please go to')
    ReadOnly = True
    TabOrder = 1
  end
end
