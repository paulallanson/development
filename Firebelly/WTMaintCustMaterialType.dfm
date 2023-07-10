object frmWTMaintCustMaterialType: TfrmWTMaintCustMaterialType
  Left = 580
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Material Types'
  ClientHeight = 185
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    443
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 78
    Height = 13
    Caption = 'Material Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 89
    Height = 13
    Caption = 'Retail Multiplier'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 148
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 148
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
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
    Height = 21
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
    Height = 21
    TabOrder = 1
    Text = 'edtRetailMultiplier'
    OnChange = EnableOK
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Material_Type'
      'SET'
      '  Retail_Multiplier = :Retail_Multiplier,'
      '  inActive = :inactive'
      'WHERE'
      '  ID = :ID')
    Left = 168
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Retail_Multiplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 400
    Top = 104
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Retail_Multiplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select max(ID) as ID'
      'From Customer_Material_Type')
    Left = 312
    Top = 104
  end
  object qryMaterialType: TQuery
    DatabaseName = 'WT'
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
  object qryGetMaterialType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Material_Type'
      'WHERE ID = :ID')
    Left = 96
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
