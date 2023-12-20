object frmSTMaintProductLvls: TfrmSTMaintProductLvls
  Left = 250
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Maintain product store levels'
  ClientHeight = 340
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 44
    Width = 52
    Height = 13
    Caption = 'Store type'
  end
  object Label4: TLabel
    Left = 8
    Top = 12
    Width = 40
    Height = 13
    Caption = 'Product'
  end
  object lblDelete: TLabel
    Left = 8
    Top = 320
    Width = 133
    Height = 13
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 72
    Width = 313
    Height = 233
    Caption = 'Stock Levels (singles)'
    TabOrder = 2
    object Label2: TLabel
      Left = 32
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Maximum'
    end
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Minimum'
    end
    object ReplenLabel: TLabel
      Left = 32
      Top = 204
      Width = 27
      Height = 13
      Caption = 'Store'
    end
    object LblReordr: TLabel
      Left = 32
      Top = 96
      Width = 69
      Height = 13
      Caption = 'Reorder Level'
    end
    object MaxMemo: TMemo
      Left = 144
      Top = 56
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 1
      WantReturns = False
      OnChange = CheckOK
      OnKeyPress = MinMemoKeyPress
    end
    object MinMemo: TMemo
      Left = 144
      Top = 24
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 0
      WantReturns = False
      OnChange = CheckOK
      OnKeyPress = MinMemoKeyPress
    end
    object rdgrpReplenishType: TRadioGroup
      Left = 32
      Top = 128
      Width = 121
      Height = 57
      Caption = 'Replenishment by'
      Items.Strings = (
        'Purchase'
        'Store')
      ParentBackground = False
      TabOrder = 3
      TabStop = True
    end
    object dblkpReplenishStore: TDBLookupComboBox
      Left = 64
      Top = 200
      Width = 201
      Height = 21
      KeyField = 'Part_Store'
      ListField = 'Part_Store_Name'
      ListSource = dtsStores
      TabOrder = 4
    end
    object MemoReOrder: TMemo
      Left = 144
      Top = 88
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 2
      WantReturns = False
      OnChange = CheckOK
      OnKeyPress = MinMemoKeyPress
    end
  end
  object btnOK: TBitBtn
    Left = 168
    Top = 312
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object CancelBitBtn: TBitBtn
    Left = 248
    Top = 312
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object edtProductCode: TEdit
    Left = 64
    Top = 8
    Width = 241
    Height = 21
    TabStop = False
    Color = clBtnFace
    TabOrder = 0
  end
  object dblkpStoreType: TDBLookupComboBox
    Left = 64
    Top = 40
    Width = 241
    Height = 21
    KeyField = 'Part_Store_Type'
    ListField = 'Part_Store_Type_Name'
    ListSource = dtsStoreType
    TabOrder = 1
  end
  object qryStores: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Store')
    Left = 192
    Top = 240
  end
  object dtsStores: TDataSource
    DataSet = qryStores
    Left = 240
    Top = 240
  end
  object qryStoreLevels: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Part_Store_levels'
      'where part_Store_type = :Part_Store_type and'
      'Part = :Part')
    Left = 248
    Top = 80
    ParamData = <
      item
        Name = 'Part_Store_type'
      end
      item
        Name = 'Part'
      end>
  end
  object qryUpdPartLevel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Store_Levels'
      'Set'
      'Minimum_Stock = :Minimum_Stock,'
      'Maximum_Stock = :Maximum_Stock,'
      'Reorder_Level = :Reorder_Level,'
      'Purchase_Or_Store = :Purchase_Or_Store,'
      'Replenish_Store = :Replenish_Store'
      'Where (Part = :Part) and'
      '      (Part_Store_Type = :Part_Store_Type)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 60
    ParamData = <
      item
        Name = 'Minimum_Stock'
      end
      item
        Name = 'Maximum_Stock'
      end
      item
        Name = 'Reorder_Level'
      end
      item
        Name = 'Purchase_Or_Store'
      end
      item
        Name = 'Replenish_Store'
        DataType = ftString
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store_Type'
      end>
  end
  object qryAddPartLevel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part_Store_Levels'
      '(Minimum_Stock, Maximum_Stock, Part, Part_Store_Type,'
      ' Purchase_Or_Store, Replenish_Store, Reorder_Level)'
      'Values'
      '(:Minimum_Stock, :Maximum_Stock, :Part, :Part_Store_Type,'
      ' :Purchase_Or_Store, :Replenish_Store, :Reorder_Level)'
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 180
    ParamData = <
      item
        Name = 'Minimum_Stock'
      end
      item
        Name = 'Maximum_Stock'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store_Type'
      end
      item
        Name = 'Purchase_Or_Store'
      end
      item
        Name = 'Replenish_Store'
        DataType = ftString
      end
      item
        Name = 'Reorder_Level'
      end>
  end
  object qryDelPartLevel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Part_Store_Levels'
      'Where (Part = :Part) and'
      '      (Part_Store_Type = :Part_Store_Type)'
      ''
      ''
      ' '
      ' ')
    Left = 24
    Top = 116
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store_Type'
      end>
  end
  object qryStoreType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Part_Store_type'
      'where part_store_type not in (select part_Store_type '
      '                              from part_Store_levels'
      '                              where part = :Part)'
      ' ')
    Left = 136
    Top = 16
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object dtsStoreType: TDataSource
    DataSet = qryStoreType
    Left = 200
    Top = 16
  end
end
