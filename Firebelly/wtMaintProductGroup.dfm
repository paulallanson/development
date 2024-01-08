object frmWtMaintProductGroup: TfrmWtMaintProductGroup
  Left = 255
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Product Groups'
  ClientHeight = 111
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    356
    111)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 74
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 74
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 54
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 3
  end
  object edtProductGroupDescription: TEdit
    Left = 80
    Top = 20
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'edtProductGroupDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Product_Group'
      'SET'
      '  Product_Group_Description = :Product_Group_Description,'
      '  inActive = :inactive'
      'WHERE'
      '  Product_Group = :Product_Group')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Product_Group_Description'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Product_Group'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Product_Group'
      '        (Product_Group,'
      '        Product_Group_Description,'
      '        inactive)'
      'Select Max(Product_Group)+1, :GUID, '#39'N'#39
      'From Product_Group'
      ' ')
    Left = 120
    Top = 24
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
      'Select Product_Group'
      'From Product_Group'
      'Where Product_Group_Description = :GUID')
    Left = 232
    Top = 24
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
    Left = 296
    Top = 24
  end
end
