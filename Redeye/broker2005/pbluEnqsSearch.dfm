object frmpbluEnqsSearch: TfrmpbluEnqsSearch
  Left = 420
  Top = 92
  BorderStyle = bsDialog
  Caption = 'Enquiry search'
  ClientHeight = 309
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    282
    309)
  PixelsPerInch = 96
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
  object Label1: TLabel
    Left = 11
    Top = 51
    Width = 65
    Height = 13
    Caption = 'Product Code'
  end
  object Label3: TLabel
    Left = 11
    Top = 75
    Width = 76
    Height = 13
    Caption = 'Form Reference'
  end
  object Label2: TLabel
    Left = 11
    Top = 26
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 122
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 11
    Top = 221
    Width = 59
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Enquiry date'
  end
  object Label6: TLabel
    Left = 11
    Top = 98
    Width = 64
    Height = 13
    Caption = 'Product Type'
  end
  object Label7: TLabel
    Left = 11
    Top = 170
    Width = 68
    Height = 13
    Caption = 'Office Contact'
  end
  object Label8: TLabel
    Left = 11
    Top = 194
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object Label10: TLabel
    Left = 11
    Top = 146
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object edtProductCode: TEdit
    Left = 120
    Top = 46
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object edtFormReference: TEdit
    Left = 120
    Top = 70
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object chkbxShowCancelled: TCheckBox
    Tag = 12
    Left = 12
    Top = 246
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show cancelled enquiries'
    TabOrder = 10
  end
  object SearchButton: TButton
    Left = 12
    Top = 270
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 11
    OnClick = SearchButtonClick
  end
  object edtBranch: TEdit
    Left = 120
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtDescription: TEdit
    Left = 120
    Top = 118
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object edtDate: TEdit
    Left = 120
    Top = 217
    Width = 89
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 8
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 217
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 9
    OnClick = btnDateClick
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
  end
  object edtProductType: TEdit
    Left = 120
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object ClearButton: TButton
    Left = 196
    Top = 270
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 12
    OnClick = ClearButtonClick
  end
  object edtAccountMgr: TEdit
    Left = 120
    Top = 166
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtOperator: TEdit
    Left = 120
    Top = 190
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object edtRep: TEdit
    Left = 120
    Top = 142
    Width = 153
    Height = 21
    TabOrder = 5
  end
end
