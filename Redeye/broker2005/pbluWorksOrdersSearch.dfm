object frmpbluWorksOrdersSearch: TfrmpbluWorksOrdersSearch
  Left = 419
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Works Order Search'
  ClientHeight = 320
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    335
    320)
  TextHeight = 17
  object Label4: TLabel
    Left = 11
    Top = 32
    Width = 39
    Height = 17
    Caption = 'Branch'
  end
  object Label6: TLabel
    Left = 11
    Top = 59
    Width = 117
    Height = 17
    Caption = 'Customer Order No'
  end
  object lblQuantity: TLabel
    Left = 11
    Top = 84
    Width = 87
    Height = 17
    Caption = 'Order Quantity'
  end
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
    Left = 138
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
  object Label2: TLabel
    Left = 11
    Top = 188
    Width = 83
    Height = 17
    Caption = 'Ordered since'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 110
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label1: TLabel
    Left = 11
    Top = 136
    Width = 47
    Height = 17
    Caption = 'Job Bag'
  end
  object Label3: TLabel
    Left = 11
    Top = 162
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object edtBranch: TEdit
    Left = 138
    Top = 28
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtCustOrderNo: TEdit
    Left = 138
    Top = 54
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object edtQuantity: TEdit
    Left = 138
    Top = 80
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object chkbxShowCancelled: TCheckBox
    Tag = 12
    Left = 11
    Top = 241
    Width = 229
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show cancelled Works Orders'
    TabOrder = 7
  end
  object SearchButton: TButton
    Left = 11
    Top = 277
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Search'
    Default = True
    TabOrder = 8
    OnClick = SearchButtonClick
  end
  object edtDate: TEdit
    Left = 138
    Top = 184
    Width = 89
    Height = 25
    TabOrder = 5
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 234
    Top = 184
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
    TabOrder = 6
    OnClick = btnDateClick
  end
  object edtDescription: TEdit
    Left = 138
    Top = 106
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtJobBag: TEdit
    Left = 138
    Top = 132
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 216
    Top = 277
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 9
    OnClick = ClearButtonClick
  end
  object edtStatus: TEdit
    Left = 138
    Top = 158
    Width = 153
    Height = 25
    TabOrder = 10
  end
  object chkbxShowWIP: TCheckBox
    Tag = 12
    Left = 11
    Top = 216
    Width = 221
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY Work in Progress'
    TabOrder = 11
  end
end
