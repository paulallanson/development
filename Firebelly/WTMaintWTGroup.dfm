object frmWTMaintWTGroup: TfrmWTMaintWTGroup
  Left = 214
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Worktop Group'
  ClientHeight = 134
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 52
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label2: TLabel
    Left = 8
    Top = 20
    Width = 64
    Height = 13
    Caption = 'Material Type'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 96
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 80
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 2
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 80
    Top = 16
    Width = 145
    Height = 21
    Enabled = False
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = srclkpMatType
    TabOrder = 0
  end
  object edtWorktopGroupDescription: TEdit
    Left = 80
    Top = 48
    Width = 225
    Height = 21
    TabOrder = 1
    Text = 'edtWorktopGroupDescription'
    OnChange = EnableOK
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 304
    Top = 16
  end
  object lkpMatType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type')
    Left = 232
    Top = 16
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Group'
      'SET'
      '  Worktop_Group_Description = :Worktop_Group_Description,'
      '  Material_type = :Material_type,'
      '  inActive = :inactive'
      'WHERE'
      '  Worktop_Group = :Worktop_Group')
    Left = 56
    Top = 56
    ParamData = <
      item
        Name = 'Worktop_Group_Description'
      end
      item
        Name = 'Material_type'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Worktop_Group'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Worktop_Group'
      '        (Worktop_Group,'
      '        Worktop_Group_Description,'
      '        Material_Type,'
      '        inactive)'
      'Select Max(Worktop_Group)+1, :GUID, 1, '#39'N'#39
      'From Worktop_Group'
      ' ')
    Left = 112
    Top = 56
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Worktop_Group'
      'From Worktop_Group'
      'Where Worktop_Group_Description = :GUID')
    Left = 224
    Top = 56
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      ''
      '')
    Left = 312
    Top = 64
  end
end
