object BrokerVersFrm: TBrokerVersFrm
  Left = 162
  Top = 162
  Width = 456
  Height = 97
  Caption = 'Broker Version Control'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusLabel: TLabel
    Left = 16
    Top = 8
    Width = 159
    Height = 19
    Caption = 'Broker Loading..........'
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
