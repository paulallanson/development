object frmWTPOrderSearch: TfrmWTPOrderSearch
  Left = 479
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Purchase Order Search'
  ClientHeight = 312
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    315
    312)
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 82
    Width = 50
    Height = 13
    Caption = 'Reference'
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
    Top = 176
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
    Top = 113
    Width = 68
    Height = 13
    Caption = 'Office Contact'
  end
  object Label6: TLabel
    Left = 18
    Top = 144
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object edtReference: TEdit
    Left = 96
    Top = 78
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object btnSearch: TButton
    Left = 16
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchClick
  end
  object edtStatus: TEdit
    Left = 96
    Top = 172
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 226
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 8
    OnClick = ClearButtonClick
  end
  object chkbxShowLive: TCheckBox
    Left = 18
    Top = 221
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live orders'
    TabOrder = 5
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 245
    Width = 215
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive/deleted orders'
    TabOrder = 6
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
    Top = 109
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object edtOperatorName: TEdit
    Left = 96
    Top = 140
    Width = 209
    Height = 21
    TabOrder = 3
  end
end
