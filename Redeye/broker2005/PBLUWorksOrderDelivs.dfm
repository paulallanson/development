object frmPBLUWorksOrderDelivs: TfrmPBLUWorksOrderDelivs
  Left = 211
  Top = 115
  Width = 830
  Height = 325
  Caption = 'Works Instruction Deliveries'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sgDelivs: TStringGrid
    Left = 0
    Top = 0
    Width = 736
    Height = 291
    Align = alClient
    ColCount = 7
    DefaultColWidth = 40
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    OnDblClick = sgDelivsDblClick
    ColWidths = (
      40
      158
      118
      109
      88
      77
      90)
  end
  object Panel7: TPanel
    Left = 736
    Top = 0
    Width = 86
    Height = 291
    Align = alRight
    TabOrder = 1
    object btnConfirm: TBitBtn
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Confirm'
      Enabled = False
      TabOrder = 0
      OnClick = btnConfirmClick
    end
    object btnDeleteDelivs: TBitBtn
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Exit'
      TabOrder = 1
      OnClick = btnDeleteDelivsClick
      NumGlyphs = 2
    end
  end
end
