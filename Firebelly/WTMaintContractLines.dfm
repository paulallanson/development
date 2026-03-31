object frmWTMaintContractLines: TfrmWTMaintContractLines
  Left = 461
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Add Drawing Lines'
  ClientHeight = 135
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    363
    135)
  TextHeight = 17
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 145
    Height = 17
    Caption = 'Number of drawing lines'
  end
  object btnOK: TBitBtn
    Left = 78
    Top = 84
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitLeft = 96
    ExplicitTop = 71
  end
  object BitBtn2: TBitBtn
    Left = 174
    Top = 84
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
    ExplicitLeft = 192
    ExplicitTop = 71
  end
  object spnLines: TSpinEdit
    Left = 192
    Top = 29
    Width = 57
    Height = 27
    MaxValue = 1000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
end
