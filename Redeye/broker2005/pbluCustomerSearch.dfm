object frmpbluCustomerSearch: TfrmpbluCustomerSearch
  Left = 514
  Top = 19
  BorderStyle = bsDialog
  Caption = 'Customer Search'
  ClientHeight = 570
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    323
    570)
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
    Left = 120
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
    Top = 60
    Width = 54
    Height = 17
    Caption = 'Postcode'
  end
  object Label13: TLabel
    Left = 11
    Top = 112
    Width = 60
    Height = 17
    Caption = 'Telephone'
  end
  object Label3: TLabel
    Left = 11
    Top = 34
    Width = 56
    Height = 17
    Caption = 'Town/City'
  end
  object Label1: TLabel
    Left = 11
    Top = 476
    Width = 79
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Created since'
    ExplicitTop = 437
  end
  object Label4: TLabel
    Left = 11
    Top = 166
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label2: TLabel
    Left = 11
    Top = 139
    Width = 19
    Height = 17
    Caption = 'Fax'
  end
  object Label5: TLabel
    Left = 11
    Top = 86
    Width = 40
    Height = 17
    Caption = 'County'
  end
  object Label7: TLabel
    Left = 11
    Top = 425
    Width = 35
    Height = 15
    Caption = 'Terms'
  end
  object Label8: TLabel
    Left = 11
    Top = 450
    Width = 91
    Height = 15
    Caption = 'Revenue Centre'
  end
  object Label10: TLabel
    Left = 11
    Top = 220
    Width = 103
    Height = 17
    Caption = 'Account Manager'
  end
  object Label11: TLabel
    Left = 11
    Top = 300
    Width = 66
    Height = 16
    Caption = 'Importance'
  end
  object lblAnalysis1: TLabel
    Left = 11
    Top = 326
    Width = 57
    Height = 15
    Caption = 'Analysis 1'
  end
  object lblAnalysis2: TLabel
    Left = 11
    Top = 350
    Width = 57
    Height = 15
    Caption = 'Analysis 2'
  end
  object Label14: TLabel
    Left = 11
    Top = 274
    Width = 87
    Height = 17
    Caption = 'Customer Type'
  end
  object Label15: TLabel
    Left = 11
    Top = 247
    Width = 95
    Height = 17
    Caption = 'Customer Status'
  end
  object Label16: TLabel
    Left = 11
    Top = 193
    Width = 88
    Height = 17
    Caption = 'Secondary Rep'
  end
  object lblAnalysis3: TLabel
    Left = 11
    Top = 375
    Width = 57
    Height = 15
    Caption = 'Analysis 3'
  end
  object lblAnalysis4: TLabel
    Left = 11
    Top = 400
    Width = 57
    Height = 15
    Caption = 'Analysis 4'
  end
  object edtTelephone: TEdit
    Left = 120
    Top = 108
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtPostcode: TEdit
    Left = 120
    Top = 54
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 12
    Top = 503
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive customers'
    TabOrder = 19
    ExplicitTop = 455
  end
  object SearchButton: TButton
    Left = 12
    Top = 535
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 20
    OnClick = SearchButtonClick
    ExplicitTop = 487
  end
  object edtTown: TEdit
    Left = 120
    Top = 27
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtDate: TEdit
    Left = 120
    Top = 472
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 17
    OnExit = edtDateExit
    ExplicitTop = 433
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 472
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
    TabOrder = 18
    OnClick = btnDateClick
  end
  object edtRep: TEdit
    Left = 120
    Top = 162
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtFax: TEdit
    Left = 120
    Top = 135
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 196
    Top = 536
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 21
    OnClick = ClearButtonClick
    ExplicitTop = 488
  end
  object edtCounty: TEdit
    Left = 120
    Top = 81
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtTerms: TEdit
    Left = 120
    Top = 421
    Width = 153
    Height = 23
    TabOrder = 15
  end
  object edtRevenueCentre: TEdit
    Left = 120
    Top = 446
    Width = 153
    Height = 23
    TabOrder = 16
  end
  object edtAccountManager: TEdit
    Left = 120
    Top = 216
    Width = 153
    Height = 25
    TabOrder = 7
  end
  object edtImportance: TEdit
    Left = 120
    Top = 296
    Width = 153
    Height = 24
    TabOrder = 10
  end
  object edtAnalysis1: TEdit
    Left = 120
    Top = 322
    Width = 153
    Height = 23
    TabOrder = 11
  end
  object edtAnalysis2: TEdit
    Left = 120
    Top = 346
    Width = 153
    Height = 23
    TabOrder = 12
  end
  object edtCustomerType: TEdit
    Left = 120
    Top = 270
    Width = 153
    Height = 25
    TabOrder = 9
  end
  object edtCustomerStatus: TEdit
    Left = 120
    Top = 243
    Width = 153
    Height = 25
    TabOrder = 8
  end
  object edtSubRep: TEdit
    Left = 120
    Top = 189
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtAnalysis3: TEdit
    Left = 120
    Top = 371
    Width = 153
    Height = 23
    TabOrder = 13
  end
  object edtAnalysis4: TEdit
    Left = 120
    Top = 396
    Width = 153
    Height = 23
    TabOrder = 14
  end
end
