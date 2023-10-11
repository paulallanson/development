object frmWTJobSearch: TfrmWTJobSearch
  Left = 476
  Top = 195
  BorderStyle = bsDialog
  Caption = 'Job Search'
  ClientHeight = 320
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    276
    320)
  TextHeight = 13
  object Label3: TLabel
    Left = 96
    Top = 24
    Width = 117
    Height = 13
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 18
    Top = 44
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 18
    Top = 99
    Width = 50
    Height = 13
    Caption = 'Reference'
  end
  object lblMaterial: TLabel
    Left = 18
    Top = 127
    Width = 37
    Height = 13
    Caption = 'Material'
  end
  object Label4: TLabel
    Left = 18
    Top = 156
    Width = 70
    Height = 13
    Caption = 'Cust Order No.'
  end
  object Label5: TLabel
    Left = 18
    Top = 71
    Width = 33
    Height = 13
    Caption = 'Project'
  end
  object Label9: TLabel
    Left = 18
    Top = 188
    Width = 27
    Height = 13
    Caption = 'Show'
  end
  object Label10: TLabel
    Left = 194
    Top = 188
    Width = 35
    Height = 13
    Caption = 'records'
  end
  object edtDescription: TEdit
    Left = 96
    Top = 40
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtReference: TEdit
    Left = 96
    Top = 95
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtMaterial: TEdit
    Left = 96
    Top = 123
    Width = 153
    Height = 21
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
  end
  object edtOrderRef: TEdit
    Left = 96
    Top = 152
    Width = 153
    Height = 21
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
  end
  object chkbxShowWIP: TCheckBox
    Left = 18
    Top = 226
    Width = 153
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show ONLY live jobs'
    TabOrder = 6
  end
  object edtProjectReference: TEdit
    Left = 96
    Top = 67
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object spnedtRecords: TSpinEdit
    Left = 96
    Top = 183
    Width = 73
    Height = 22
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
  end
end
