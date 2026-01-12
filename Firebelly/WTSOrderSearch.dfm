object frmWTSOrderSearch: TfrmWTSOrderSearch
  Left = 486
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Sales Order Search'
  ClientHeight = 441
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    357
    441)
  TextHeight = 17
  object Label2: TLabel
    Left = 18
    Top = 135
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 18
    Top = 162
    Width = 95
    Height = 17
    Caption = 'Customer Order'
  end
  object Label3: TLabel
    Left = 117
    Top = 24
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
    Left = 18
    Top = 274
    Width = 35
    Height = 17
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 18
    Top = 52
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 18
    Top = 219
    Width = 82
    Height = 17
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 247
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object Label7: TLabel
    Left = 18
    Top = 80
    Width = 40
    Height = 17
    Caption = 'Project'
  end
  object Label8: TLabel
    Left = 18
    Top = 191
    Width = 36
    Height = 17
    Caption = 'Quote'
  end
  object Label9: TLabel
    Left = 18
    Top = 305
    Width = 31
    Height = 17
    Caption = 'Show'
  end
  object Label10: TLabel
    Left = 202
    Top = 305
    Width = 45
    Height = 17
    Caption = 'records'
  end
  object Label11: TLabel
    Left = 18
    Top = 106
    Width = 60
    Height = 17
    Caption = 'Site Name'
  end
  object edtReference: TEdit
    Left = 119
    Top = 132
    Width = 209
    Height = 25
    TabOrder = 13
  end
  object btnSearch: TButton
    Left = 16
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 11
    OnClick = btnSearchClick
    ExplicitTop = 373
  end
  object edtCustomerOrder: TEdit
    Left = 119
    Top = 160
    Width = 209
    Height = 25
    TabOrder = 3
  end
  object edtStatus: TEdit
    Left = 119
    Top = 271
    Width = 209
    Height = 25
    TabOrder = 7
  end
  object ClearButton: TButton
    Left = 226
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 12
    OnClick = ClearButtonClick
    ExplicitTop = 373
  end
  object chkbxShowLive: TCheckBox
    Left = 18
    Top = 350
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live orders'
    TabOrder = 9
    ExplicitTop = 319
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 374
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted orders'
    TabOrder = 10
    ExplicitTop = 343
  end
  object edtDescription: TEdit
    Left = 119
    Top = 49
    Width = 209
    Height = 25
    TabOrder = 0
  end
  object edtOfficeContact: TEdit
    Left = 119
    Top = 216
    Width = 209
    Height = 25
    TabOrder = 5
  end
  object edtOperatorName: TEdit
    Left = 119
    Top = 244
    Width = 209
    Height = 25
    TabOrder = 6
  end
  object edtProjectReference: TEdit
    Left = 119
    Top = 77
    Width = 209
    Height = 25
    TabOrder = 1
  end
  object edtQuote: TEdit
    Left = 119
    Top = 189
    Width = 209
    Height = 25
    TabOrder = 4
  end
  object spnedtRecords: TSpinEdit
    Left = 119
    Top = 301
    Width = 73
    Height = 27
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object edtSiteName: TEdit
    Left = 119
    Top = 104
    Width = 209
    Height = 25
    TabOrder = 2
  end
end
