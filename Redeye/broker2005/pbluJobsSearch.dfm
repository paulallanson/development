object frmpbluJobsSearch: TfrmpbluJobsSearch
  Left = 448
  Top = 70
  BorderStyle = bsDialog
  Caption = 'Jobs Search'
  ClientHeight = 556
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    357
    556)
  TextHeight = 17
  object Label9: TLabel
    Left = 11
    Top = 7
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
    Left = 146
    Top = 7
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
    Top = 58
    Width = 118
    Height = 17
    Caption = 'Customer Reference'
  end
  object Label13: TLabel
    Left = 11
    Top = 83
    Width = 73
    Height = 17
    Caption = 'Job Quantity'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 161
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 11
    Top = 109
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label3: TLabel
    Left = 11
    Top = 32
    Width = 39
    Height = 17
    Caption = 'Branch'
  end
  object Label1: TLabel
    Left = 11
    Top = 376
    Width = 83
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Ordered since'
  end
  object lblDescriptiveRef: TLabel
    Left = 11
    Top = 187
    Width = 126
    Height = 17
    Caption = 'Descriptive Reference'
  end
  object Label4: TLabel
    Left = 11
    Top = 239
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 291
    Width = 103
    Height = 17
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 317
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object Label8: TLabel
    Left = 11
    Top = 135
    Width = 102
    Height = 17
    Caption = 'Production Status'
  end
  object Label10: TLabel
    Left = 11
    Top = 402
    Width = 71
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Required by'
  end
  object Label11: TLabel
    Left = 11
    Top = 213
    Width = 36
    Height = 17
    Caption = 'Quote'
  end
  object Label14: TLabel
    Left = 11
    Top = 265
    Width = 88
    Height = 17
    Caption = 'Secondary Rep'
  end
  object Label15: TLabel
    Left = 11
    Top = 343
    Width = 53
    Height = 17
    Caption = 'End User'
  end
  object edtQuantity: TEdit
    Left = 146
    Top = 79
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtCustOrderNo: TEdit
    Left = 146
    Top = 53
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 11
    Top = 483
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive jobs'
    TabOrder = 18
    ExplicitTop = 440
  end
  object SearchButton: TButton
    Left = 12
    Top = 515
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Search'
    Default = True
    TabOrder = 19
    OnClick = SearchButtonClick
    ExplicitTop = 472
  end
  object edtDescription: TEdit
    Left = 146
    Top = 157
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtStatus: TEdit
    Left = 146
    Top = 105
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtBranch: TEdit
    Left = 146
    Top = 27
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtDate: TEdit
    Left = 146
    Top = 372
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 13
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 242
    Top = 372
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 14
    OnClick = btnDateClick
  end
  object edtDescriptiveRef: TEdit
    Left = 146
    Top = 183
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtRep: TEdit
    Left = 146
    Top = 235
    Width = 153
    Height = 25
    TabOrder = 8
  end
  object edtAccountMgr: TEdit
    Left = 146
    Top = 287
    Width = 153
    Height = 25
    TabOrder = 10
  end
  object edtOperator: TEdit
    Left = 146
    Top = 313
    Width = 153
    Height = 25
    TabOrder = 11
  end
  object ClearButton: TButton
    Left = 224
    Top = 515
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 20
    OnClick = ClearButtonClick
  end
  object chkbxShowWIP: TCheckBox
    Tag = 12
    Left = 11
    Top = 434
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY Work in Progress'
    TabOrder = 17
    ExplicitTop = 391
  end
  object edtProductionStatus: TEdit
    Left = 146
    Top = 131
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object edtDateReq: TEdit
    Left = 146
    Top = 398
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 15
    OnExit = edtDateReqExit
  end
  object btnDateReq: TBitBtn
    Left = 242
    Top = 398
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 16
    OnClick = btnDateReqClick
  end
  object edtQuote: TEdit
    Left = 146
    Top = 209
    Width = 153
    Height = 25
    TabOrder = 7
  end
  object edtSubRep: TEdit
    Left = 146
    Top = 261
    Width = 153
    Height = 25
    TabOrder = 9
  end
  object edtEndUser: TEdit
    Left = 146
    Top = 339
    Width = 153
    Height = 25
    TabOrder = 12
  end
  object chkbxShowOnHold: TCheckBox
    Tag = 12
    Left = 11
    Top = 457
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY On Hold'
    TabOrder = 21
    ExplicitTop = 414
  end
end
