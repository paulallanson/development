object frmWTMaintContractLines: TfrmWTMaintContractLines
  Left = 461
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Add Drawing Lines'
  ClientHeight = 131
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    387
    131)
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 113
    Height = 13
    Caption = 'Number of drawing lines'
  end
  object btnOK: TBitBtn
    Left = 108
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 204
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object spnLines: TSpinEdit
    Left = 152
    Top = 27
    Width = 57
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
end
