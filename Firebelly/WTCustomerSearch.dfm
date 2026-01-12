object frmWTCustomerSearch: TfrmWTCustomerSearch
  Left = 274
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Customer Search'
  ClientHeight = 343
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    263
    343)
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 36
    Width = 34
    Height = 17
    Caption = 'Street'
  end
  object Label2: TLabel
    Left = 10
    Top = 63
    Width = 37
    Height = 17
    Caption = 'Locale'
  end
  object lblMaterial: TLabel
    Left = 10
    Top = 90
    Width = 30
    Height = 17
    Caption = 'Town'
  end
  object Label3: TLabel
    Left = 97
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
    Top = 118
    Width = 54
    Height = 17
    Caption = 'Postcode'
  end
  object Label5: TLabel
    Left = 10
    Top = 145
    Width = 40
    Height = 17
    Caption = 'County'
  end
  object Label6: TLabel
    Left = 10
    Top = 172
    Width = 36
    Height = 17
    Caption = 'Phone'
  end
  object Label7: TLabel
    Left = 10
    Top = 200
    Width = 27
    Height = 17
    Caption = 'Type'
  end
  object Label8: TLabel
    Left = 10
    Top = 229
    Width = 79
    Height = 17
    Caption = 'Created since'
  end
  object edtStreet: TEdit
    Left = 97
    Top = 32
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtlocale: TEdit
    Left = 97
    Top = 59
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object btnSearch: TButton
    Left = 10
    Top = 303
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 10
    OnClick = btnSearchClick
    ExplicitTop = 294
  end
  object edtTown: TEdit
    Left = 97
    Top = 86
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtPostcode: TEdit
    Left = 97
    Top = 114
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object ClearButton: TButton
    Left = 162
    Top = 303
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 11
    OnClick = ClearButtonClick
    ExplicitTop = 294
  end
  object edtCounty: TEdit
    Left = 97
    Top = 141
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object edtPhone: TEdit
    Left = 97
    Top = 168
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtType: TEdit
    Left = 97
    Top = 196
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtDate: TEdit
    Left = 97
    Top = 225
    Width = 89
    Height = 25
    TabOrder = 7
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 193
    Top = 223
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
    TabOrder = 8
    OnClick = btnDateClick
  end
  object chkbxIncludeProspects: TCheckBox
    Left = 8
    Top = 265
    Width = 185
    Height = 17
    Caption = 'Include Prospects'
    TabOrder = 9
  end
end
