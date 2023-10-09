object STMaintCourierFrm: TSTMaintCourierFrm
  Left = 216
  Top = 126
  BorderStyle = bsDialog
  Caption = 'Courier Details'
  ClientHeight = 263
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    438
    263)
  TextHeight = 13
  object DelLabel: TLabel
    Left = 104
    Top = 233
    Width = 155
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Really Delete This Courier ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 264
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 352
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 425
    Height = 209
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 64
      Height = 13
      Caption = 'Courier Name'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 88
      Height = 13
      Caption = 'Our Account Code'
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 85
      Height = 13
      Caption = 'Transfer File Type'
    end
    object NameEdit: TEdit
      Left = 104
      Top = 8
      Width = 249
      Height = 21
      MaxLength = 40
      TabOrder = 0
      OnChange = NameEditChange
    end
    object AccountEdit: TEdit
      Left = 104
      Top = 40
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 1
      OnChange = AccountEditChange
    end
    object edtFileType: TEdit
      Left = 104
      Top = 72
      Width = 121
      Height = 21
      MaxLength = 5
      TabOrder = 2
    end
    object chkbxAddressRequired: TCheckBox
      Left = 8
      Top = 114
      Width = 153
      Height = 17
      Caption = 'Requires Delivery Address'
      TabOrder = 3
    end
    object chkbxAccountCodeMandatory: TCheckBox
      Left = 8
      Top = 153
      Width = 257
      Height = 17
      Caption = 'Account Code Mandatory if using Client Account'
      TabOrder = 5
    end
    object chkbxActive: TCheckBox
      Left = 8
      Top = 186
      Width = 185
      Height = 17
      Caption = 'Courier is active'
      TabOrder = 6
    end
    object chkbxReturnAddress: TCheckBox
      Left = 8
      Top = 133
      Width = 153
      Height = 17
      Caption = 'Requires Return Address'
      TabOrder = 4
    end
  end
  object CheckExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Courier'
      'From Courier'
      'Where (Courier_Name = :Courier_Name) and'
      '      (Courier <> :Courier)'
      '')
    Left = 402
    Top = 34
    ParamData = <
      item
        Name = 'Courier_Name'
      end
      item
        Name = 'Courier'
      end>
  end
  object GetLastOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Courier FROM Courier WHERE Courier_Name = :GUID'
      ' ')
    Left = 346
    Top = 26
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Courier (Courier, Courier_Name, Our_Account_Code)'
      'SELECT Max(Courier)+1, :GUID, '#39'0'#39' FROM Courier'
      ' ')
    Left = 186
    Top = 26
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Courier'
      'Set'
      'Courier_Name = :Courier_Name,'
      'our_Account_Code = :Our_Account_Code, '
      'courier_file_type = :courier_file_type,'
      'Delivery_Address_Req = :Delivery_Address_Req,'
      'Customer_Account_Mandatory = :Customer_Account_Mandatory,'
      'Return_Address_Required = :Return_Address_Required,'
      'Inactive = :Inactive'
      'Where (Courier = :Courier)'
      ''
      ' ')
    Left = 234
    Top = 26
    ParamData = <
      item
        Name = 'Courier_Name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Our_Account_Code'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'courier_file_type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Delivery_Address_Req'
      end
      item
        Name = 'Customer_Account_Mandatory'
      end
      item
        Name = 'Return_Address_Required'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Courier'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DelOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Courier'
      'Where (Courier = :Courier)'
      ' ')
    Left = 290
    Top = 26
    ParamData = <
      item
        Name = 'Courier'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Courier (Courier, Name, Account)'
      'SELECT Max(Courier)+1, :GUID, '#39'0'#39' FROM Courier'
      ' '
      ' '
      ' ')
    Left = 402
    Top = 2
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
