object Compositor: TCompositor
  Left = 477
  Top = 215
  Caption = 'Compositor'
  ClientHeight = 307
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Container: TMemo
    Left = 10
    Top = 8
    Width = 201
    Height = 89
    Lines.Strings = (
      'Container for printable lines')
    TabOrder = 0
    WantReturns = False
  end
end
