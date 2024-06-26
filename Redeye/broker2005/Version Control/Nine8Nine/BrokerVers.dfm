object BrokerVersFrm: TBrokerVersFrm
  Left = 173
  Top = 162
  Caption = 'Redeye Version Control'
  ClientHeight = 58
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object StatusLabel: TLabel
    Left = 16
    Top = 8
    Width = 165
    Height = 19
    Caption = 'Redeye Loading..........'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 240
    Top = 8
    Width = 121
    Height = 21
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
