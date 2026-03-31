object frmWTMaintCustMaterialType: TfrmWTMaintCustMaterialType
  Left = 580
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Material Types'
  ClientHeight = 173
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    431
    173)
  TextHeight = 17
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 84
    Height = 17
    Caption = 'Material Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 100
    Height = 17
    Caption = 'Retail Multiplier'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 136
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
    ExplicitTop = 139
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 136
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
    ExplicitTop = 139
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 98
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 2
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 120
    Top = 16
    Width = 273
    Height = 25
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = dftsMaterialType
    TabOrder = 0
    OnClick = EnableOK
  end
  object edtRetailMultiplier: TCREditFloat
    Left = 119
    Top = 52
    Width = 84
    Height = 25
    TabOrder = 1
    Text = 'edtRetailMultiplier'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Material_Type'
      'SET'
      '  Retail_Multiplier = :Retail_Multiplier,'
      '  inActive = :inactive'
      'WHERE'
      '  ID = :ID')
    Left = 250
    Top = 42
    ParamData = <
      item
        Name = 'Retail_Multiplier'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'ID'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 400
    Top = 104
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Material_Type'
      '('
      '        Customer,'
      '        Material_Type,'
      '        Retail_Multiplier,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Customer,'
      '        :Material_Type,'
      '        :Retail_Multiplier,'
      '        :inactive'
      ')'
      ' ')
    Left = 248
    Top = 104
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Retail_Multiplier'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(ID) as ID'
      'From Customer_Material_Type')
    Left = 312
    Top = 104
  end
  object qryMaterialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Type'
      'WHERE inactive = '#39'N'#39
      'ORDER BY Description')
    Left = 296
    Top = 16
  end
  object dftsMaterialType: TDataSource
    DataSet = qryMaterialType
    Left = 384
    Top = 16
  end
  object qryGetMaterialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Material_Type'
      'WHERE ID = :ID')
    Left = 296
    Top = 46
    ParamData = <
      item
        Name = 'ID'
      end>
  end
end
