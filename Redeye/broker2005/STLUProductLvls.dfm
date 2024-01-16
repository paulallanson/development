object frmSTLUProductLvls: TfrmSTLUProductLvls
  Left = 134
  Top = 134
  BorderStyle = bsDialog
  Caption = 'Product stock levels'
  ClientHeight = 170
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    522
    170)
  TextHeight = 13
  object Button1: TButton
    Left = 173
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object btnChange: TButton
    Left = 254
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Change'
    Enabled = False
    TabOrder = 1
    OnClick = btnChangeClick
  end
  object btnClose: TButton
    Left = 439
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Clos&e'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object dbgDetails: TDBGrid
    Left = 8
    Top = 8
    Width = 506
    Height = 120
    DataSource = dtsStoreLevels
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Part_Store_type_Name'
        Title.Caption = 'Store type'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Minimum_Stock'
        Title.Caption = 'Min Stock'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Maximum_Stock'
        Title.Caption = 'Max Stock'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reorder_Level'
        Title.Caption = 'Reorder Level'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Purchase_Or_Store'
        Title.Caption = 'Replenish type'
        Width = 132
        Visible = True
      end>
  end
  object qryStoreLevels: TFDQuery
    OnCalcFields = qryStoreLevelsCalcFields
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select part_Store_levels.*, Part_Store_type_Name'
      'from part_Store_levels, part_store_type'
      'where Part = :Part and'
      
        'Part_Store_levels.part_Store_type = part_Store_type.part_Store_t' +
        'ype')
    Left = 344
    Top = 16
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryStoreLevelsPart: TWideStringField
      FieldName = 'Part'
      Origin = 'Part'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 25
    end
    object qryStoreLevelsPart_Store_Type: TIntegerField
      FieldName = 'Part_Store_Type'
      Origin = 'Part_Store_Type'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryStoreLevelsMinimum_Stock: TIntegerField
      FieldName = 'Minimum_Stock'
      Origin = 'Minimum_Stock'
      Required = True
    end
    object qryStoreLevelsMaximum_Stock: TIntegerField
      FieldName = 'Maximum_Stock'
      Origin = 'Maximum_Stock'
      Required = True
    end
    object qryStoreLevelsPurchase_Or_Store: TWideStringField
      FieldName = 'Purchase_Or_Store'
      Origin = 'Purchase_Or_Store'
      Required = True
      Size = 1
    end
    object qryStoreLevelsReplenish_Store: TIntegerField
      FieldName = 'Replenish_Store'
      Origin = 'Replenish_Store'
    end
    object qryStoreLevelsReorder_Level: TIntegerField
      FieldName = 'Reorder_Level'
      Origin = 'Reorder_Level'
    end
    object qryStoreLevelsPart_Store_type_Name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Part_Store_type_Name'
      Origin = 'Part_Store_type_Name'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryStoreLevelsReplenish_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'Replenish_type'
      Calculated = True
    end
  end
  object dtsStoreLevels: TDataSource
    DataSet = qryStoreLevels
    OnDataChange = SetButtons
    Left = 424
    Top = 16
  end
end
