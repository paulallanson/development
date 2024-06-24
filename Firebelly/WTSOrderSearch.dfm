object frmWTSOrderSearch: TfrmWTSOrderSearch
  Left = 486
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Sales Order Search'
  ClientHeight = 419
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    328
    419)
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 132
    Width = 51
    Height = 13
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 18
    Top = 155
    Width = 82
    Height = 13
    Caption = 'Customer Order'
  end
  object Label3: TLabel
    Left = 109
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
    Top = 264
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
    Top = 209
    Width = 74
    Height = 13
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 237
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
    Top = 181
    Width = 32
    Height = 13
    Caption = 'Quote'
  end
  object Label9: TLabel
    Left = 18
    Top = 295
    Width = 29
    Height = 13
    Caption = 'Show'
  end
  object Label10: TLabel
    Left = 194
    Top = 295
    Width = 38
    Height = 13
    Caption = 'records'
  end
  object Label11: TLabel
    Left = 18
    Top = 106
    Width = 51
    Height = 13
    Caption = 'Site Name'
  end
  object edtReference: TEdit
    Left = 111
    Top = 129
    Width = 209
    Height = 21
    TabOrder = 13
  end
  object btnSearch: TButton
    Left = 16
    Top = 382
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 11
    OnClick = btnSearchClick
    ExplicitTop = 349
  end
  object edtCustomerOrder: TEdit
    Left = 111
    Top = 153
    Width = 209
    Height = 21
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 111
    Top = 261
    Width = 209
    Height = 21
    TabOrder = 7
  end
  object ClearButton: TButton
    Left = 226
    Top = 382
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 12
    OnClick = ClearButtonClick
    ExplicitTop = 349
  end
  object chkbxShowLive: TCheckBox
    Left = 18
    Top = 328
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live orders'
    TabOrder = 9
    ExplicitTop = 295
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 352
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted orders'
    TabOrder = 10
    ExplicitTop = 319
  end
  object edtDescription: TEdit
    Left = 111
    Top = 49
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edtOfficeContact: TEdit
    Left = 111
    Top = 206
    Width = 209
    Height = 21
    TabOrder = 5
  end
  object edtOperatorName: TEdit
    Left = 111
    Top = 234
    Width = 209
    Height = 21
    TabOrder = 6
  end
  object edtProjectReference: TEdit
    Left = 111
    Top = 75
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object edtQuote: TEdit
    Left = 111
    Top = 179
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object spnedtRecords: TSpinEdit
    Left = 111
    Top = 291
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object edtSiteName: TEdit
    Left = 111
    Top = 104
    Width = 209
    Height = 21
    TabOrder = 2
  end
end
