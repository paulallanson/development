object frmWTSInvoiceSearch: TfrmWTSInvoiceSearch
  Left = 486
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Search'
  ClientHeight = 366
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    338
    366)
  TextHeight = 17
  object Label2: TLabel
    Left = 18
    Top = 109
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object lblOrderReference: TLabel
    Left = 18
    Top = 80
    Width = 69
    Height = 17
    Caption = 'Sales Order'
  end
  object Label3: TLabel
    Left = 108
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
    Top = 253
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
    Top = 195
    Width = 82
    Height = 17
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 224
    Width = 63
    Height = 17
    Caption = 'Created By'
  end
  object Label8: TLabel
    Left = 18
    Top = 167
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label11: TLabel
    Left = 18
    Top = 139
    Width = 60
    Height = 17
    Caption = 'Site Name'
  end
  object edtReference: TEdit
    Left = 108
    Top = 105
    Width = 209
    Height = 25
    TabOrder = 10
  end
  object btnSearch: TButton
    Left = 16
    Top = 329
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 8
    OnClick = btnSearchClick
    ExplicitTop = 298
  end
  object edtCustomerOrder: TEdit
    Left = 108
    Top = 76
    Width = 209
    Height = 25
    TabOrder = 1
  end
  object edtStatus: TEdit
    Left = 108
    Top = 249
    Width = 209
    Height = 25
    TabOrder = 6
  end
  object ClearButton: TButton
    Left = 226
    Top = 329
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
    ExplicitTop = 298
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 291
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted invoices'
    TabOrder = 7
    ExplicitTop = 260
  end
  object edtDescription: TEdit
    Left = 108
    Top = 48
    Width = 209
    Height = 25
    TabOrder = 0
  end
  object edtOfficeContact: TEdit
    Left = 108
    Top = 191
    Width = 209
    Height = 25
    TabOrder = 4
  end
  object edtOperatorName: TEdit
    Left = 108
    Top = 220
    Width = 209
    Height = 25
    TabOrder = 5
  end
  object edtRepName: TEdit
    Left = 108
    Top = 163
    Width = 209
    Height = 25
    TabOrder = 3
  end
  object edtSiteName: TEdit
    Left = 108
    Top = 135
    Width = 209
    Height = 25
    TabOrder = 2
  end
end
