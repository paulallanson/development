object frmpbLogin: TfrmpbLogin
  Left = 267
  Top = 201
  ActiveControl = PasswordEdit
  BorderStyle = bsDialog
  Caption = 'Logon'
  ClientHeight = 183
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  TextHeight = 17
  object Label1: TLabel
    Left = 32
    Top = 84
    Width = 76
    Height = 17
    Caption = 'Logon Name'
  end
  object Label2: TLabel
    Left = 32
    Top = 116
    Width = 56
    Height = 17
    Caption = 'Password'
  end
  object lblLogInto: TLabel
    Left = 32
    Top = 148
    Width = 55
    Height = 17
    Caption = 'Database'
  end
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 318
    Height = 17
    Caption = 'Welcome to the Print Management Information System'
  end
  object Label4: TLabel
    Left = 32
    Top = 48
    Width = 262
    Height = 17
    Caption = 'Please enter your logon name and password'
  end
  object UserEdit: TEdit
    Left = 115
    Top = 81
    Width = 209
    Height = 25
    TabOrder = 0
    OnChange = UserEditChange
  end
  object PasswordEdit: TEdit
    Left = 115
    Top = 112
    Width = 209
    Height = 25
    PasswordChar = '*'
    TabOrder = 1
    OnChange = PasswordEditChange
  end
  object OKBitBtn: TBitBtn
    Left = 365
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 3
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 365
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
    OnClick = CancelBitBtnClick
  end
  object cmbAliasList: TComboBox
    Left = 115
    Top = 144
    Width = 161
    Height = 25
    Style = csDropDownList
    TabOrder = 2
  end
  object GetOperatorSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Operator'
      'Where Login_Name = :Login_Name')
    Left = 273
    ParamData = <
      item
        Name = 'Login_Name'
        ParamType = ptInput
      end>
  end
end
