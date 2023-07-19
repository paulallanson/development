object frmWTRunScripts: TfrmWTRunScripts
  Left = 557
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Run Database Scripts'
  ClientHeight = 273
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    483
    273)
  PixelsPerInch = 96
  TextHeight = 13
  object memQuery: TMemo
    Left = 24
    Top = 8
    Width = 441
    Height = 201
    Lines.Strings = (
      'memQuery')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 386
    Top = 232
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button4Click
  end
  object qryRun: TFDQuery
    ConnectionName = 'WT'
    Left = 200
    Top = 48
  end
end
