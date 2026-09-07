object PBEnqRespQtyFrm: TPBEnqRespQtyFrm
  Left = 211
  Top = 124
  Caption = 'Add Supplier Response Quantity'
  ClientHeight = 126
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 109
    Height = 17
    Caption = 'Response Quantity'
  end
  object Label2: TLabel
    Left = 88
    Top = 48
    Width = 28
    Height = 17
    Caption = 'Price'
  end
  object Label3: TLabel
    Left = 204
    Top = 48
    Width = 23
    Height = 17
    Caption = 'Unit'
  end
  object ResponseQtyMemo: TMemo
    Left = 124
    Top = 12
    Width = 73
    Height = 25
    Alignment = taRightJustify
    TabOrder = 0
    WantReturns = False
    WordWrap = False
    OnExit = ResponseQtyMemoExit
    OnKeyPress = ResponseQtyMemoKeyPress
  end
  object PriceMemo: TMemo
    Left = 124
    Top = 44
    Width = 73
    Height = 25
    Alignment = taRightJustify
    TabOrder = 1
    WantReturns = False
    WordWrap = False
    OnExit = PriceMemoExit
    OnKeyPress = PriceMemoKeyPress
  end
  object PUnitCombo: TComboBox
    Left = 236
    Top = 44
    Width = 145
    Height = 25
    Style = csDropDownList
    TabOrder = 2
    OnClick = PUnitComboClick
  end
  object OKBtn: TBitBtn
    Left = 115
    Top = 88
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object CancelBtn: TBitBtn
    Left = 203
    Top = 88
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
end
