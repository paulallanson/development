object frmPBLUContractSearch: TfrmPBLUContractSearch
  Left = 478
  Top = 70
  BorderStyle = bsDialog
  Caption = 'Contract Search'
  ClientHeight = 374
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    282
    374)
  TextHeight = 13
  object Label9: TLabel
    Left = 11
    Top = 2
    Width = 51
    Height = 13
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 120
    Top = 2
    Width = 148
    Height = 13
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 11
    Top = 34
    Width = 35
    Height = 13
    Caption = 'Volume'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 106
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 11
    Top = 82
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 11
    Top = 227
    Width = 66
    Height = 13
    Caption = 'Ordered since'
  end
  object Label4: TLabel
    Left = 11
    Top = 130
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 178
    Width = 85
    Height = 13
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 202
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object Label10: TLabel
    Left = 11
    Top = 251
    Width = 57
    Height = 13
    Caption = 'Required by'
  end
  object Label14: TLabel
    Left = 11
    Top = 154
    Width = 74
    Height = 13
    Caption = 'Secondary Rep'
  end
  object Label3: TLabel
    Left = 11
    Top = 58
    Width = 79
    Height = 13
    Caption = 'Minimum Volume'
  end
  object edtQuantity: TEdit
    Left = 120
    Top = 30
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 12
    Top = 301
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive contracts'
    TabOrder = 13
  end
  object SearchButton: TButton
    Left = 12
    Top = 333
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 14
    OnClick = SearchButtonClick
  end
  object edtDescription: TEdit
    Left = 120
    Top = 102
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 120
    Top = 78
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtDate: TEdit
    Left = 120
    Top = 223
    Width = 89
    Height = 21
    TabOrder = 8
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 221
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 9
    OnClick = btnDateClick
  end
  object edtRep: TEdit
    Left = 120
    Top = 126
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object edtAccountMgr: TEdit
    Left = 120
    Top = 174
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtOperator: TEdit
    Left = 120
    Top = 198
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object ClearButton: TButton
    Left = 198
    Top = 334
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 15
    OnClick = ClearButtonClick
  end
  object chkbxShowWIP: TCheckBox
    Tag = 12
    Left = 12
    Top = 278
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live contracts'
    TabOrder = 12
  end
  object edtDateReq: TEdit
    Left = 120
    Top = 247
    Width = 89
    Height = 21
    TabOrder = 10
    OnExit = edtDateReqExit
  end
  object btnDateReq: TBitBtn
    Left = 216
    Top = 245
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btnDateReqClick
  end
  object edtSubRep: TEdit
    Left = 120
    Top = 150
    Width = 153
    Height = 21
    TabOrder = 5
  end
  object edtMinimumQuantity: TEdit
    Left = 120
    Top = 54
    Width = 153
    Height = 21
    TabOrder = 1
  end
end
