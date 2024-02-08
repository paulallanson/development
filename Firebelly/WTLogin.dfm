object frmWTLogin: TfrmWTLogin
  Left = 204
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Logon'
  ClientHeight = 175
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
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
    Top = 108
    Width = 49
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 226
    Height = 13
    Caption = 'Welcome to the worktop production system'
  end
  object Label4: TLabel
    Left = 32
    Top = 56
    Width = 229
    Height = 13
    Caption = 'Please enter your logon name and password'
  end
  object lblLogInto: TLabel
    Left = 32
    Top = 134
    Width = 48
    Height = 13
    Caption = 'Database'
  end
  object UserEdit: TEdit
    Left = 104
    Top = 77
    Width = 201
    Height = 21
    TabOrder = 0
    OnChange = UserEditChange
  end
  object PasswordEdit: TEdit
    Left = 104
    Top = 104
    Width = 201
    Height = 21
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
  object Edit1: TEdit
    Left = 320
    Top = 88
    Width = 33
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    Visible = False
  end
  object cmbAliasList: TComboBox
    Left = 104
    Top = 130
    Width = 161
    Height = 21
    Style = csDropDownList
    TabOrder = 2
  end
  object GetOperatorSQL: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select * From Operator'
      'Where Login_Name = :Login_Name')
    Left = 330
    Top = 114
    ParamData = <
      item
        Name = 'Login_Name'
      end>
  end
end
