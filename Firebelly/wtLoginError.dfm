object frmWTLoginError: TfrmWTLoginError
  Left = 227
  Top = 156
  BorderStyle = bsDialog
  Caption = 'Initialisation Error'
  ClientHeight = 299
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 321
    Height = 241
    Color = clHighlightText
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'The Firebelly demonstration software cannot be '
      'run. This may be because:'
      ''
      '(1)    You do not have at least Office '#39'97 or Access '
      #39'97'
      '       installed on your PC.'
      ''
      '(2)    You do not have at least the Access '#39'97 ODBC '
      'drivers'
      '       installed on your PC.'
      ''
      '(3)    One of the above has not been correctly'
      '       installed.'
      ''
      'Please contact Quaystone Design on 0870 950 0805 '
      'for'
      'assistance.')
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 264
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
end
