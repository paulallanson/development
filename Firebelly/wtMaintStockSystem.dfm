object frmWTMaintStockSystem: TfrmWTMaintStockSystem
  Left = 629
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Stock System Details'
  ClientHeight = 346
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    424
    346)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 52
    Width = 29
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 20
    Width = 66
    Height = 13
    Caption = 'Stock System'
  end
  object btnOK: TBitBtn
    Left = 132
    Top = 308
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
  end
  object BitBtn2: TBitBtn
    Left = 220
    Top = 308
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
  end
  object edtStockSystemDescription: TEdit
    Left = 96
    Top = 48
    Width = 225
    Height = 21
    TabOrder = 1
    Text = 'edtStockSystemDescription'
    OnChange = EnableOK
  end
  object edtStockSystem: TEdit
    Left = 96
    Top = 16
    Width = 105
    Height = 21
    TabOrder = 0
    Text = 'edtStockSystem'
    OnChange = EnableOK
  end
  object pnlStockSystem: TGroupBox
    Left = 8
    Top = 112
    Width = 409
    Height = 185
    TabOrder = 3
    object Label3: TLabel
      Left = 19
      Top = 24
      Width = 75
      Height = 13
      Caption = 'Database Alias'
    end
    object Label4: TLabel
      Left = 19
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Username'
    end
    object Label5: TLabel
      Left = 19
      Top = 72
      Width = 49
      Height = 13
      Caption = 'Password'
    end
    object Label6: TLabel
      Left = 19
      Top = 130
      Width = 116
      Height = 13
      Caption = 'Order Import Directory'
    end
    object Label7: TLabel
      Left = 19
      Top = 100
      Width = 129
      Height = 13
      Caption = 'Order Processing Interval'
    end
    object Label8: TLabel
      Left = 200
      Top = 100
      Width = 24
      Height = 13
      Caption = 'secs.'
    end
    object edtDatabaseAlias: TEdit
      Left = 153
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtDatabaseAlias'
    end
    object edtUsername: TEdit
      Left = 153
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'edtUsername'
    end
    object edtPassword: TEdit
      Left = 153
      Top = 68
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtPassword'
    end
    object edtOrderImportDirectory: TEdit
      Left = 19
      Top = 149
      Width = 297
      Height = 21
      TabOrder = 4
      Text = 'edtOrderImportDirectory'
    end
    object Button3: TButton
      Left = 323
      Top = 147
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 5
      OnClick = Button3Click
    end
    object spnInterval: TSpinEdit
      Left = 153
      Top = 95
      Width = 41
      Height = 22
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
    Left = 176
    Top = 64
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
    Left = 120
    Top = 64
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
