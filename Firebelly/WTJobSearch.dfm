object frmWTJobSearch: TfrmWTJobSearch
  Left = 476
  Top = 195
  BorderStyle = bsDialog
  Caption = 'Job Search'
  ClientHeight = 320
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    288
    320)
  TextHeight = 17
  object Label3: TLabel
    Left = 114
    Top = 19
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
  object Label1: TLabel
    Left = 18
    Top = 44
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 18
    Top = 99
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 18
    Top = 127
    Width = 48
    Height = 17
    Caption = 'Material'
  end
  object Label4: TLabel
    Left = 18
    Top = 156
    Width = 89
    Height = 17
    Caption = 'Cust Order No.'
  end
  object Label5: TLabel
    Left = 18
    Top = 71
    Width = 40
    Height = 17
    Caption = 'Project'
  end
  object Label9: TLabel
    Left = 18
    Top = 188
    Width = 31
    Height = 17
    Caption = 'Show'
  end
  object Label10: TLabel
    Left = 198
    Top = 188
    Width = 45
    Height = 17
    Caption = 'records'
  end
  object edtDescription: TEdit
    Left = 114
    Top = 40
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object edtReference: TEdit
    Left = 114
    Top = 95
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtMaterial: TEdit
    Left = 114
    Top = 123
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object btnSearch: TButton
    Left = 16
    Top = 278
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 8
    OnClick = btnSearchClick
    ExplicitTop = 269
  end
  object edtOrderRef: TEdit
    Left = 114
    Top = 152
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 170
    Top = 278
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
    ExplicitTop = 269
  end
  object chkbxShowWIP: TCheckBox
    Left = 18
    Top = 226
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live jobs'
    TabOrder = 6
    ExplicitTop = 217
  end
  object edtProjectReference: TEdit
    Left = 114
    Top = 67
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object spnedtRecords: TSpinEdit
    Left = 114
    Top = 183
    Width = 73
    Height = 27
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object chkbxShowInactive: TCheckBox
    Left = 18
    Top = 250
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show inactive jobs'
    TabOrder = 7
    ExplicitTop = 241
  end
end
