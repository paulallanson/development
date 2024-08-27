object frmWTLogin: TfrmWTLogin
  Left = 204
  Top = 180
  ActiveControl = PasswordEdit
  BorderStyle = bsDialog
  Caption = 'Logon'
  ClientHeight = 175
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  TextHeight = 17
  object Label1: TLabel
    Left = 32
    Top = 83
    Width = 76
    Height = 17
    Caption = 'Logon Name'
  end
  object Label2: TLabel
    Left = 32
    Top = 109
    Width = 56
    Height = 17
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 255
    Height = 17
    Caption = 'Welcome to the worktop production system'
  end
  object Label4: TLabel
    Left = 32
    Top = 51
    Width = 262
    Height = 17
    Caption = 'Please enter your logon name and password'
  end
  object lblLogInto: TLabel
    Left = 32
    Top = 140
    Width = 55
    Height = 17
    Caption = 'Database'
  end
  object UserEdit: TEdit
    Left = 114
    Top = 79
    Width = 180
    Height = 25
    TabOrder = 0
    OnChange = UserEditChange
  end
  object PasswordEdit: TEdit
    Left = 114
    Top = 107
    Width = 180
    Height = 25
    PasswordChar = '*'
    TabOrder = 1
    OnChange = PasswordEditChange
  end
  object OKBitBtn: TBitBtn
    Left = 316
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
    Left = 316
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object cmbAliasList: TComboBox
    Left = 114
    Top = 136
    Width = 161
    Height = 25
    Style = csDropDownList
    TabOrder = 2
  end
  object GetOperatorSQL: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select * From Operator'
      'Where Login_Name = :Login_Name')
    Left = 329
    Top = 114
    ParamData = <
      item
        Name = 'Login_Name'
      end>
  end
end
