object frmpbluOrdersSearch: TfrmpbluOrdersSearch
  Left = 539
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Order Search'
  ClientHeight = 498
  ClientWidth = 343
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
    343
    498)
  TextHeight = 17
  object Label4: TLabel
    Left = 11
    Top = 33
    Width = 39
    Height = 17
    Caption = 'Branch'
  end
  object lblFormReference: TLabel
    Left = 11
    Top = 191
    Width = 92
    Height = 17
    Caption = 'Form Reference'
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
    Top = 217
    Width = 87
    Height = 17
    Caption = 'Order Quantity'
  end
  object lblProductCode: TLabel
    Left = 11
    Top = 164
    Width = 80
    Height = 17
    Caption = 'Product Code'
  end
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
  object Label2: TLabel
    Left = 11
    Top = 380
    Width = 83
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Ordered since'
    ExplicitTop = 343
  end
  object lblDescription: TLabel
    Left = 11
    Top = 244
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object lblSupplier: TLabel
    Left = 11
    Top = 85
    Width = 48
    Height = 17
    Caption = 'Supplier'
  end
  object lblDescriptiveRef: TLabel
    Left = 11
    Top = 270
    Width = 126
    Height = 17
    Caption = 'Descriptive Reference'
  end
  object lblJobNumber: TLabel
    Left = 11
    Top = 112
    Width = 73
    Height = 17
    Caption = 'Job Number'
  end
  object lblStatus: TLabel
    Left = 11
    Top = 138
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 11
    Top = 296
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label5: TLabel
    Left = 11
    Top = 323
    Width = 103
    Height = 17
    Caption = 'Account Manager'
  end
  object Label7: TLabel
    Left = 11
    Top = 349
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object edtBranch: TEdit
    Left = 146
    Top = 29
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtCustOrderNo: TEdit
    Left = 146
    Top = 55
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object edtProductCode: TEdit
    Left = 146
    Top = 160
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtFormReference: TEdit
    Left = 146
    Top = 187
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtQuantity: TEdit
    Left = 146
    Top = 213
    Width = 153
    Height = 25
    TabOrder = 7
  end
  object chkbxShowCancelled: TCheckBox
    Tag = 12
    Left = 12
    Top = 431
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show cancelled Orders'
    TabOrder = 16
    ExplicitTop = 385
  end
  object SearchButton: TButton
    Left = 12
    Top = 463
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Search'
    Default = True
    TabOrder = 17
    OnClick = SearchButtonClick
    ExplicitTop = 417
  end
  object edtDate: TEdit
    Left = 146
    Top = 376
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 13
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 242
    Top = 376
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
    Left = 146
    Top = 240
    Width = 153
    Height = 25
    TabOrder = 8
  end
  object edtSupplier: TEdit
    Left = 146
    Top = 81
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtDescriptiveRef: TEdit
    Left = 146
    Top = 266
    Width = 153
    Height = 25
    TabOrder = 9
  end
  object edtJobNumber: TEdit
    Left = 146
    Top = 108
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 146
    Top = 134
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 224
    Top = 463
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 18
    OnClick = ClearButtonClick
  end
  object chkbxShowWIP: TCheckBox
    Tag = 12
    Left = 12
    Top = 407
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY Work in Progress'
    TabOrder = 15
    ExplicitTop = 361
  end
  object edtRep: TEdit
    Left = 146
    Top = 292
    Width = 153
    Height = 25
    TabOrder = 10
  end
  object edtAccountMgr: TEdit
    Left = 146
    Top = 319
    Width = 153
    Height = 25
    TabOrder = 11
  end
  object edtOperator: TEdit
    Left = 146
    Top = 345
    Width = 153
    Height = 25
    TabOrder = 12
  end
end
