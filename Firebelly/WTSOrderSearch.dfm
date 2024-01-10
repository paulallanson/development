object frmWTSOrderSearch: TfrmWTSOrderSearch
  Left = 486
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Sales Order Search'
  ClientHeight = 395
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    315
    395)
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 104
    Width = 51
    Height = 13
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 18
    Top = 131
    Width = 82
    Height = 13
    Caption = 'Customer Order'
  end
  object Label3: TLabel
    Left = 96
    Top = 24
    Width = 123
    Height = 13
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 240
    Width = 32
    Height = 13
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 18
    Top = 52
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 18
    Top = 185
    Width = 74
    Height = 13
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 213
    Width = 47
    Height = 13
    Caption = 'Operator'
  end
  object Label7: TLabel
    Left = 18
    Top = 78
    Width = 35
    Height = 13
    Caption = 'Project'
  end
  object Label8: TLabel
    Left = 18
    Top = 157
    Width = 32
    Height = 13
    Caption = 'Quote'
  end
  object Label9: TLabel
    Left = 18
    Top = 271
    Width = 29
    Height = 13
    Caption = 'Show'
  end
  object Label10: TLabel
    Left = 194
    Top = 271
    Width = 38
    Height = 13
    Caption = 'records'
  end
  object Label11: TLabel
    Left = 18
    Top = 107
    Width = 49
    Height = 13
    Caption = 'Site Name'
  end
  object edtReference: TEdit
    Left = 96
    Top = 100
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object btnSearch: TButton
    Left = 16
    Top = 358
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 11
    OnClick = btnSearchClick
  end
  object edtCustomerOrder: TEdit
    Left = 96
    Top = 128
    Width = 209
    Height = 21
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 96
    Top = 236
    Width = 209
    Height = 21
    TabOrder = 7
  end
  object ClearButton: TButton
    Left = 226
    Top = 358
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 12
    OnClick = ClearButtonClick
  end
  object chkbxShowLive: TCheckBox
    Left = 18
    Top = 304
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live orders'
    TabOrder = 9
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 328
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted orders'
    TabOrder = 10
  end
  object edtDescription: TEdit
    Left = 96
    Top = 48
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edtOfficeContact: TEdit
    Left = 96
    Top = 181
    Width = 209
    Height = 21
    TabOrder = 5
  end
  object edtOperatorName: TEdit
    Left = 96
    Top = 209
    Width = 209
    Height = 21
    TabOrder = 6
  end
  object edtProjectReference: TEdit
    Left = 96
    Top = 74
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object edtQuote: TEdit
    Left = 96
    Top = 154
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object spnedtRecords: TSpinEdit
    Left = 96
    Top = 266
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object edtSiteName: TEdit
    Left = 96
    Top = 103
    Width = 209
    Height = 21
    TabOrder = 2
  end
end
