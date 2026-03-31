object frmWTMaintStockSystem: TfrmWTMaintStockSystem
  Left = 629
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Stock System Details'
  ClientHeight = 368
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    424
    368)
  TextHeight = 17
  object label1: TLabel
    Left = 8
    Top = 52
    Width = 35
    Height = 17
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 20
    Width = 76
    Height = 17
    Caption = 'Stock System'
  end
  object btnOK: TBitBtn
    Left = 132
    Top = 330
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOKClick
    ExplicitTop = 308
  end
  object BitBtn2: TBitBtn
    Left = 220
    Top = 330
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
    ExplicitTop = 308
  end
  object edtStockSystemDescription: TEdit
    Left = 96
    Top = 48
    Width = 225
    Height = 25
    TabOrder = 1
    Text = 'edtStockSystemDescription'
    OnChange = EnableOK
  end
  object edtStockSystem: TEdit
    Left = 96
    Top = 16
    Width = 105
    Height = 25
    TabOrder = 0
    Text = 'edtStockSystem'
    OnChange = EnableOK
  end
  object pnlStockSystem: TGroupBox
    Left = 8
    Top = 112
    Width = 409
    Height = 212
    TabOrder = 3
    object Label3: TLabel
      Left = 19
      Top = 30
      Width = 86
      Height = 17
      Caption = 'Database Alias'
    end
    object Label4: TLabel
      Left = 19
      Top = 61
      Width = 59
      Height = 17
      Caption = 'Username'
    end
    object Label5: TLabel
      Left = 19
      Top = 92
      Width = 56
      Height = 17
      Caption = 'Password'
    end
    object Label6: TLabel
      Left = 19
      Top = 154
      Width = 135
      Height = 17
      Caption = 'Order Import Directory'
    end
    object Label7: TLabel
      Left = 19
      Top = 124
      Width = 148
      Height = 17
      Caption = 'Order Processing Interval'
    end
    object Label8: TLabel
      Left = 232
      Top = 124
      Width = 28
      Height = 17
      Caption = 'secs.'
    end
    object edtDatabaseAlias: TEdit
      Left = 185
      Top = 27
      Width = 121
      Height = 25
      TabOrder = 0
      Text = 'edtDatabaseAlias'
    end
    object edtUsername: TEdit
      Left = 185
      Top = 58
      Width = 121
      Height = 25
      TabOrder = 1
      Text = 'edtUsername'
    end
    object edtPassword: TEdit
      Left = 185
      Top = 89
      Width = 121
      Height = 25
      TabOrder = 2
      Text = 'edtPassword'
    end
    object edtOrderImportDirectory: TEdit
      Left = 19
      Top = 173
      Width = 297
      Height = 25
      TabOrder = 4
      Text = 'edtOrderImportDirectory'
    end
    object Button3: TButton
      Left = 323
      Top = 173
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 5
      OnClick = Button3Click
    end
    object spnInterval: TSpinEdit
      Left = 185
      Top = 119
      Width = 41
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
  end
  object chkbxExternalSystem: TCheckBox
    Left = 16
    Top = 109
    Width = 137
    Height = 17
    Caption = 'External Stock System'
    TabOrder = 2
    OnClick = chkbxExternalSystemClick
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_System'
      'SET'
      '  Stock_System_Description = :Stock_System_Description,'
      '  External_System = :External_System,'
      '  Database_Alias_Name = :Database_Alias_Name,'
      '  Login_Username = :Login_Username,'
      '  Login_Password = :Login_Password,'
      '  Order_Process_Interval = :Order_Process_Interval,'
      '  Sales_Order_Import_Directory = :Sales_Order_Import_Directory'
      'WHERE'
      '  Stock_System = :Stock_System')
    Left = 364
    Top = 16
    ParamData = <
      item
        Name = 'Stock_System_Description'
      end
      item
        Name = 'External_System'
      end
      item
        Name = 'Database_Alias_Name'
      end
      item
        Name = 'Login_Username'
      end
      item
        Name = 'Login_Password'
      end
      item
        Name = 'Order_Process_Interval'
      end
      item
        Name = 'Sales_Order_Import_Directory'
      end
      item
        Name = 'Stock_System'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Stock_System'
      '        (Stock_System,'
      '        Stock_System_Description)'
      'Values'
      '        (:Stock_System,'
      '         :Stock_System_Description)'
      ''
      ' ')
    Left = 358
    Top = 168
    ParamData = <
      item
        Name = 'Stock_System'
      end
      item
        Name = 'Stock_System_Description'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 296
    Top = 72
  end
end
