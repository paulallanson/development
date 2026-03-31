object frmWTPOrderSearch: TfrmWTPOrderSearch
  Left = 479
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Purchase Order Search'
  ClientHeight = 323
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    359
    323)
  TextHeight = 17
  object Label2: TLabel
    Left = 18
    Top = 82
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object Label3: TLabel
    Left = 109
    Top = 16
    Width = 192
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
    Top = 176
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
    Top = 113
    Width = 82
    Height = 17
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 144
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object edtReference: TEdit
    Left = 109
    Top = 78
    Width = 209
    Height = 25
    TabOrder = 1
  end
  object btnSearch: TButton
    Left = 16
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchClick
    ExplicitTop = 275
  end
  object edtStatus: TEdit
    Left = 109
    Top = 172
    Width = 209
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 226
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 8
    OnClick = ClearButtonClick
    ExplicitTop = 275
  end
  object chkbxShowLive: TCheckBox
    Left = 18
    Top = 224
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live orders'
    TabOrder = 5
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 248
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted orders'
    TabOrder = 6
  end
  object edtDescription: TEdit
    Left = 109
    Top = 48
    Width = 209
    Height = 25
    TabOrder = 0
  end
  object edtOfficeContact: TEdit
    Left = 109
    Top = 109
    Width = 209
    Height = 25
    TabOrder = 2
  end
  object edtOperatorName: TEdit
    Left = 109
    Top = 140
    Width = 209
    Height = 25
    TabOrder = 3
  end
end
