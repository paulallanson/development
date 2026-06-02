object frmFirebellyVers: TfrmFirebellyVers
  Left = 162
  Top = 162
  Caption = 'Aktiv Design Version Control'
  ClientHeight = 71
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 17
  object StatusLabel: TLabel
    Left = 16
    Top = 8
    Width = 237
    Height = 19
    Caption = 'Loading Firebelly System ..........'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 304
    Top = 8
    Width = 121
    Height = 25
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 40
    Width = 409
    Height = 16
    TabOrder = 1
  end
end
