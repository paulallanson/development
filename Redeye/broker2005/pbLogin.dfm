object frmpbLogin: TfrmpbLogin
  Left = 267
  Top = 201
  ActiveControl = PasswordEdit
  BorderStyle = bsDialog
  Caption = 'Logon'
  ClientHeight = 183
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 84
    Width = 65
    Height = 13
    Caption = 'Logon Name'
  end
  object Label2: TLabel
    Left = 32
    Top = 116
    Width = 49
    Height = 13
    Caption = 'Password'
  end
  object lblLogInto: TLabel
    Left = 32
    Top = 148
    Width = 48
    Height = 13
    Caption = 'Database'
  end
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 281
    Height = 13
    Caption = 'Welcome to the Print Management Information System'
  end
  object Label4: TLabel
    Left = 32
    Top = 48
    Width = 229
    Height = 13
    Caption = 'Please enter your logon name and password'
  end
  object UserEdit: TEdit
    Left = 104
    Top = 80
    Width = 209
    Height = 21
    TabOrder = 0
    OnChange = UserEditChange
  end
  object PasswordEdit: TEdit
    Left = 104
    Top = 112
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnChange = PasswordEditChange
  end
  object OKBitBtn: TBitBtn
    Left = 344
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
    Left = 344
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
    Left = 104
    Top = 144
    Width = 161
    Height = 21
    Style = csDropDownList
    TabOrder = 2
  end
  object GetOperatorSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Operator'
      'Where Login_Name = :Login_Name')
    Left = 208
    Top = 32
    ParamData = <
      item
        Name = 'Login_Name'
        ParamType = ptInput
      end>
  end
end
