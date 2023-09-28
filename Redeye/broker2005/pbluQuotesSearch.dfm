object frmpbluQuotesSearch: TfrmpbluQuotesSearch
  Left = 360
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Quote Search'
  ClientHeight = 405
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    288
    405)
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
  object Label6: TLabel
    Left = 11
    Top = 51
    Width = 97
    Height = 13
    Caption = 'Customer Reference'
  end
  object Label13: TLabel
    Left = 11
    Top = 74
    Width = 39
    Height = 13
    Caption = 'Quantity'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 122
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 11
    Top = 98
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label3: TLabel
    Left = 11
    Top = 27
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object Label1: TLabel
    Left = 11
    Top = 275
    Width = 66
    Height = 13
    Caption = 'Ordered since'
  end
  object Label4: TLabel
    Left = 11
    Top = 146
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 194
    Width = 85
    Height = 13
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 218
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object Label8: TLabel
    Left = 11
    Top = 170
    Width = 74
    Height = 13
    Caption = 'Secondary Rep'
  end
  object Label10: TLabel
    Left = 11
    Top = 243
    Width = 44
    Height = 13
    Caption = 'End User'
  end
  object edtQuantity: TEdit
    Left = 120
    Top = 70
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtCustOrderNo: TEdit
    Left = 120
    Top = 46
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 12
    Top = 333
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show declined quotes'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object SearchButton: TButton
    Left = 12
    Top = 365
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
    Top = 118
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object edtStatus: TEdit
    Left = 120
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtBranch: TEdit
    Left = 120
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtDate: TEdit
    Left = 120
    Top = 271
    Width = 89
    Height = 21
    TabOrder = 10
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 269
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
    Left = 120
    Top = 142
    Width = 153
    Height = 21
    TabOrder = 5
  end
  object edtAccountMgr: TEdit
    Left = 120
    Top = 190
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object edtOperator: TEdit
    Left = 120
    Top = 214
    Width = 153
    Height = 21
    TabOrder = 8
  end
  object ClearButton: TButton
    Left = 198
    Top = 366
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 15
    OnClick = ClearButtonClick
  end
  object chkbxShowLive: TCheckBox
    Tag = 12
    Left = 12
    Top = 310
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live quotes'
    TabOrder = 12
  end
  object edtSubRep: TEdit
    Left = 120
    Top = 166
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtEndUser: TEdit
    Left = 120
    Top = 239
    Width = 153
    Height = 21
    TabOrder = 9
  end
end
