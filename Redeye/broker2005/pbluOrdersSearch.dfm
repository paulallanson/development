object frmpbluOrdersSearch: TfrmpbluOrdersSearch
  Left = 539
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Order Search'
  ClientHeight = 461
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    288
    461)
  TextHeight = 13
  object Label4: TLabel
    Left = 11
    Top = 26
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object lblFormReference: TLabel
    Left = 11
    Top = 172
    Width = 76
    Height = 13
    Caption = 'Form Reference'
  end
  object Label6: TLabel
    Left = 11
    Top = 50
    Width = 90
    Height = 13
    Caption = 'Customer Order No'
  end
  object lblQuantity: TLabel
    Left = 11
    Top = 196
    Width = 68
    Height = 13
    Caption = 'Order Quantity'
  end
  object lblProductCode: TLabel
    Left = 11
    Top = 147
    Width = 65
    Height = 13
    Caption = 'Product Code'
  end
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
  object Label2: TLabel
    Left = 11
    Top = 343
    Width = 66
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Ordered since'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 221
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lblSupplier: TLabel
    Left = 11
    Top = 74
    Width = 38
    Height = 13
    Caption = 'Supplier'
  end
  object lblDescriptiveRef: TLabel
    Left = 11
    Top = 245
    Width = 106
    Height = 13
    Caption = 'Descriptive Reference'
  end
  object lblJobNumber: TLabel
    Left = 11
    Top = 99
    Width = 57
    Height = 13
    Caption = 'Job Number'
  end
  object lblStatus: TLabel
    Left = 11
    Top = 123
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 11
    Top = 269
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 294
    Width = 85
    Height = 13
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 318
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object edtBranch: TEdit
    Left = 120
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtCustOrderNo: TEdit
    Left = 120
    Top = 46
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object edtProductCode: TEdit
    Left = 120
    Top = 143
    Width = 153
    Height = 21
    TabOrder = 5
  end
  object edtFormReference: TEdit
    Left = 120
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtQuantity: TEdit
    Left = 120
    Top = 192
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object chkbxShowCancelled: TCheckBox
    Tag = 12
    Left = 12
    Top = 394
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show cancelled Orders'
    TabOrder = 16
  end
  object SearchButton: TButton
    Left = 12
    Top = 426
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 17
    OnClick = SearchButtonClick
  end
  object edtDate: TEdit
    Left = 120
    Top = 339
    Width = 89
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 13
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 337
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
  object edtDescription: TEdit
    Left = 120
    Top = 217
    Width = 153
    Height = 21
    TabOrder = 8
  end
  object edtSupplier: TEdit
    Left = 120
    Top = 70
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtDescriptiveRef: TEdit
    Left = 120
    Top = 241
    Width = 153
    Height = 21
    TabOrder = 9
  end
  object edtJobNumber: TEdit
    Left = 120
    Top = 95
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 120
    Top = 119
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 196
    Top = 426
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 18
    OnClick = ClearButtonClick
  end
  object chkbxShowWIP: TCheckBox
    Tag = 12
    Left = 12
    Top = 370
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY Work in Progress'
    TabOrder = 15
  end
  object edtRep: TEdit
    Left = 120
    Top = 265
    Width = 153
    Height = 21
    TabOrder = 10
  end
  object edtAccountMgr: TEdit
    Left = 120
    Top = 290
    Width = 153
    Height = 21
    TabOrder = 11
  end
  object edtOperator: TEdit
    Left = 120
    Top = 314
    Width = 153
    Height = 21
    TabOrder = 12
  end
end
