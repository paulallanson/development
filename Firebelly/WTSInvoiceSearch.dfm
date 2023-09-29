object frmWTSInvoiceSearch: TfrmWTSInvoiceSearch
  Left = 486
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Search'
  ClientHeight = 344
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    315
    344)
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 109
    Width = 50
    Height = 13
    Caption = 'Reference'
  end
  object lblOrderReference: TLabel
    Left = 18
    Top = 80
    Width = 55
    Height = 13
    Caption = 'Sales Order'
  end
  object Label3: TLabel
    Left = 96
    Top = 24
    Width = 117
    Height = 13
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 224
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label1: TLabel
    Left = 18
    Top = 52
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 18
    Top = 166
    Width = 68
    Height = 13
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 195
    Width = 52
    Height = 13
    Caption = 'Created By'
  end
  object Label8: TLabel
    Left = 18
    Top = 138
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object edtReference: TEdit
    Left = 96
    Top = 105
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object btnSearch: TButton
    Left = 16
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 8
    OnClick = btnSearchClick
  end
  object edtCustomerOrder: TEdit
    Left = 96
    Top = 76
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object edtStatus: TEdit
    Left = 96
    Top = 220
    Width = 209
    Height = 21
    TabOrder = 6
  end
  object ClearButton: TButton
    Left = 226
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 269
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted invoices'
    TabOrder = 7
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
    Top = 162
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object edtOperatorName: TEdit
    Left = 96
    Top = 191
    Width = 209
    Height = 21
    TabOrder = 5
  end
  object edtRepName: TEdit
    Left = 96
    Top = 134
    Width = 209
    Height = 21
    TabOrder = 3
  end
end
