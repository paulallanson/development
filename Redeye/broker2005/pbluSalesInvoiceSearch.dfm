object frmpbluSalesInvoiceSearch: TfrmpbluSalesInvoiceSearch
  Left = 479
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Invoice Search'
  ClientHeight = 286
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    334
    286)
  TextHeight = 17
  object Label9: TLabel
    Left = 8
    Top = 9
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
    Left = 132
    Top = 9
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
    Top = 168
    Width = 71
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Invoice Date'
    ExplicitTop = 163
  end
  object lblDescription: TLabel
    Left = 11
    Top = 37
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object lblJobNumber: TLabel
    Left = 11
    Top = 139
    Width = 113
    Height = 17
    Caption = 'Order/Job Number'
  end
  object lblStatus: TLabel
    Left = 11
    Top = 113
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 11
    Top = 63
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label3: TLabel
    Left = 11
    Top = 89
    Width = 88
    Height = 17
    Caption = 'Secondary Rep'
  end
  object chkbxShowDeleted: TCheckBox
    Tag = 12
    Left = 12
    Top = 219
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show deleted invoices'
    TabOrder = 8
    ExplicitTop = 214
  end
  object SearchButton: TButton
    Left = 12
    Top = 251
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Search'
    Default = True
    TabOrder = 9
    OnClick = SearchButtonClick
    ExplicitTop = 246
  end
  object edtDate: TEdit
    Left = 132
    Top = 164
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    OnExit = edtDateExit
    ExplicitTop = 166
  end
  object btnDate: TBitBtn
    Left = 228
    Top = 164
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
    OnClick = btnDateClick
    ExplicitTop = 166
  end
  object edtDescription: TEdit
    Left = 132
    Top = 33
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtJobNumber: TEdit
    Left = 132
    Top = 135
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object edtStatus: TEdit
    Left = 132
    Top = 109
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object ClearButton: TButton
    Left = 196
    Top = 251
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 10
    OnClick = ClearButtonClick
    ExplicitTop = 246
  end
  object chkbxShowArchived: TCheckBox
    Tag = 12
    Left = 12
    Top = 195
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show archived invoices'
    TabOrder = 7
    ExplicitTop = 190
  end
  object edtRep: TEdit
    Left = 132
    Top = 59
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object edtSubRep: TEdit
    Left = 132
    Top = 85
    Width = 153
    Height = 25
    TabOrder = 2
  end
end
