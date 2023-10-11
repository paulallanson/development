object PBMaintEnqAddChgsfrm: TPBMaintEnqAddChgsfrm
  Left = 212
  Top = 118
  ActiveControl = DescriptionEdit
  BorderStyle = bsDialog
  Caption = 'Maintain Additional Charges'
  ClientHeight = 122
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 24
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object CostLbl: TLabel
    Left = 48
    Top = 56
    Width = 21
    Height = 13
    Caption = 'Cost'
  end
  object PriceLbl: TLabel
    Left = 192
    Top = 56
    Width = 24
    Height = 13
    Caption = 'Price'
  end
  object OKBtn: TBitBtn
    Left = 91
    Top = 88
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 171
    Top = 88
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object DescriptionEdit: TEdit
    Left = 80
    Top = 16
    Width = 241
    Height = 21
    TabOrder = 0
    OnKeyUp = DescriptionEditKeyUp
  end
  object CostMemo: TMemo
    Left = 80
    Top = 48
    Width = 89
    Height = 23
    Alignment = taRightJustify
    Lines.Strings = (
      '0.00')
    TabOrder = 1
    WantReturns = False
    WordWrap = False
    OnExit = CostMemoExit
    OnKeyPress = CostMemoKeyPress
    OnKeyUp = DescriptionEditKeyUp
  end
  object PriceMemo: TMemo
    Left = 232
    Top = 48
    Width = 89
    Height = 23
    Alignment = taRightJustify
    Lines.Strings = (
      '0.00')
    TabOrder = 2
    WantReturns = False
    WordWrap = False
    OnExit = CostMemoExit
    OnKeyPress = CostMemoKeyPress
    OnKeyUp = DescriptionEditKeyUp
  end
end
