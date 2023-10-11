object frmpbluSupplierSearch: TfrmpbluSupplierSearch
  Left = 260
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Supplier Search'
  ClientHeight = 242
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    288
    242)
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
    Font.Name = 'Segoe UI'
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
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 11
    Top = 51
    Width = 45
    Height = 13
    Caption = 'Postcode'
  end
  object Label13: TLabel
    Left = 11
    Top = 98
    Width = 51
    Height = 13
    Caption = 'Telephone'
  end
  object Label3: TLabel
    Left = 11
    Top = 27
    Width = 49
    Height = 13
    Caption = 'Town/City'
  end
  object Label1: TLabel
    Left = 11
    Top = 148
    Width = 65
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Created since'
    Visible = False
  end
  object Label2: TLabel
    Left = 11
    Top = 122
    Width = 17
    Height = 13
    Caption = 'Fax'
  end
  object Label5: TLabel
    Left = 11
    Top = 75
    Width = 33
    Height = 13
    Caption = 'County'
  end
  object edtTelephone: TEdit
    Left = 120
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtPostcode: TEdit
    Left = 120
    Top = 46
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object chkbxShowInactive: TCheckBox
    Tag = 12
    Left = 12
    Top = 175
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive suppliers'
    TabOrder = 7
  end
  object SearchButton: TButton
    Left = 12
    Top = 207
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 8
    OnClick = SearchButtonClick
  end
  object edtTown: TEdit
    Left = 120
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtDate: TEdit
    Left = 120
    Top = 144
    Width = 89
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    Visible = False
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 142
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
    TabOrder = 6
    Visible = False
    OnClick = btnDateClick
  end
  object edtFax: TEdit
    Left = 120
    Top = 118
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 196
    Top = 208
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
  end
  object edtCounty: TEdit
    Left = 120
    Top = 70
    Width = 153
    Height = 21
    TabOrder = 2
  end
end
