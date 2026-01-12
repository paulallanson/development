object frmWTQuoteSearch: TfrmWTQuoteSearch
  Left = 457
  Top = 84
  BorderStyle = bsDialog
  Caption = 'Quote Search'
  ClientHeight = 438
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    274
    438)
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 36
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 10
    Top = 88
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 10
    Top = 116
    Width = 48
    Height = 17
    Caption = 'Material'
  end
  object Label3: TLabel
    Left = 95
    Top = 8
    Width = 143
    Height = 17
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 144
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 10
    Top = 171
    Width = 36
    Height = 17
    Caption = 'Quote'
  end
  object Label6: TLabel
    Left = 10
    Top = 295
    Width = 31
    Height = 17
    Caption = 'Show'
  end
  object Label7: TLabel
    Left = 193
    Top = 295
    Width = 45
    Height = 17
    Caption = 'records'
  end
  object Label8: TLabel
    Left = 10
    Top = 64
    Width = 40
    Height = 17
    Caption = 'Project'
  end
  object Label9: TLabel
    Left = 10
    Top = 265
    Width = 73
    Height = 17
    Caption = 'Expires after'
  end
  object Label10: TLabel
    Left = 10
    Top = 234
    Width = 76
    Height = 17
    Caption = 'Quotes Since'
  end
  object Label11: TLabel
    Left = 10
    Top = 202
    Width = 58
    Height = 17
    Caption = 'Show Last'
  end
  object Label12: TLabel
    Left = 153
    Top = 202
    Width = 88
    Height = 17
    Caption = 'Months quotes'
  end
  object edtDescription: TEdit
    Left = 95
    Top = 32
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtReference: TEdit
    Left = 95
    Top = 83
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object btnSearch: TButton
    Left = 8
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchClick
    ExplicitTop = 375
  end
  object edtMaterial: TEdit
    Left = 95
    Top = 111
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtStatus: TEdit
    Left = 95
    Top = 139
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object ClearButton: TButton
    Left = 170
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 8
    OnClick = ClearButtonClick
    ExplicitTop = 375
  end
  object chkbxShowLive: TCheckBox
    Left = 8
    Top = 344
    Width = 199
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live Quotes'
    TabOrder = 5
    ExplicitTop = 315
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 9
    Top = 367
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show declined quotes'
    Checked = True
    State = cbChecked
    TabOrder = 6
    ExplicitTop = 338
  end
  object edtQuoteReference: TEdit
    Left = 95
    Top = 167
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object spnedtRecords: TSpinEdit
    Left = 95
    Top = 290
    Width = 73
    Height = 27
    MaxValue = 0
    MinValue = 0
    TabOrder = 9
    Value = 0
  end
  object edtProjectReference: TEdit
    Left = 95
    Top = 59
    Width = 153
    Height = 25
    TabOrder = 10
  end
  object edtExpiryDate: TEdit
    Left = 95
    Top = 261
    Width = 89
    Height = 25
    TabOrder = 11
    OnExit = edtExpiryDateExit
  end
  object btnExpiryDate: TBitBtn
    Left = 191
    Top = 259
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
    TabOrder = 12
    OnClick = btnExpiryDateClick
  end
  object edtQuoteDate: TEdit
    Left = 95
    Top = 229
    Width = 89
    Height = 25
    TabOrder = 13
    OnExit = edtExpiryDateExit
  end
  object btnQuoteDate: TBitBtn
    Left = 191
    Top = 228
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
    TabOrder = 14
    OnClick = btnQuoteDateClick
  end
  object spnedtMonths: TSpinEdit
    Left = 95
    Top = 197
    Width = 49
    Height = 27
    MaxValue = 0
    MinValue = 0
    TabOrder = 15
    Value = 0
  end
end
