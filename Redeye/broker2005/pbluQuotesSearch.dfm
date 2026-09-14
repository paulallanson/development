object frmpbluQuotesSearch: TfrmpbluQuotesSearch
  Left = 360
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Quote Search'
  ClientHeight = 435
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    337
    435)
  TextHeight = 17
  object Label9: TLabel
    Left = 11
    Top = 8
    Width = 64
    Height = 17
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 136
    Top = 8
    Width = 182
    Height = 17
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 11
    Top = 69
    Width = 118
    Height = 17
    Caption = 'Customer Reference'
  end
  object Label13: TLabel
    Left = 11
    Top = 94
    Width = 48
    Height = 17
    Caption = 'Quantity'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 146
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 11
    Top = 120
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label3: TLabel
    Left = 11
    Top = 43
    Width = 39
    Height = 17
    Caption = 'Branch'
  end
  object Label1: TLabel
    Left = 11
    Top = 308
    Width = 83
    Height = 17
    Caption = 'Ordered since'
  end
  object Label4: TLabel
    Left = 11
    Top = 172
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 224
    Width = 103
    Height = 17
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 250
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object Label8: TLabel
    Left = 11
    Top = 198
    Width = 88
    Height = 17
    Caption = 'Secondary Rep'
  end
  object Label10: TLabel
    Left = 11
    Top = 276
    Width = 53
    Height = 17
    Caption = 'End User'
  end
  object edtQuantity: TEdit
    Left = 136
    Top = 90
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtCustOrderNo: TEdit
    Left = 136
    Top = 64
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 12
    Top = 363
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show declined quotes'
    Checked = True
    State = cbChecked
    TabOrder = 13
    ExplicitTop = 324
  end
  object SearchButton: TButton
    Left = 12
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Search'
    Default = True
    TabOrder = 14
    OnClick = SearchButtonClick
    ExplicitTop = 356
  end
  object edtDescription: TEdit
    Left = 136
    Top = 142
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object edtStatus: TEdit
    Left = 136
    Top = 116
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtBranch: TEdit
    Left = 136
    Top = 38
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtDate: TEdit
    Left = 136
    Top = 304
    Width = 89
    Height = 25
    TabOrder = 10
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 232
    Top = 304
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
    OnClick = btnDateClick
  end
  object edtRep: TEdit
    Left = 136
    Top = 168
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtAccountMgr: TEdit
    Left = 136
    Top = 220
    Width = 153
    Height = 25
    TabOrder = 7
  end
  object edtOperator: TEdit
    Left = 136
    Top = 246
    Width = 153
    Height = 25
    TabOrder = 8
  end
  object ClearButton: TButton
    Left = 214
    Top = 396
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 15
    OnClick = ClearButtonClick
    ExplicitTop = 399
  end
  object chkbxShowLive: TCheckBox
    Tag = 12
    Left = 12
    Top = 340
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live quotes'
    TabOrder = 12
    ExplicitTop = 301
  end
  object edtSubRep: TEdit
    Left = 136
    Top = 194
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtEndUser: TEdit
    Left = 136
    Top = 272
    Width = 153
    Height = 25
    TabOrder = 9
  end
end
