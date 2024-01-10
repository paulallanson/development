object frmWTLUWorktopThicknessSlabs: TfrmWTLUWorktopThicknessSlabs
  Left = 461
  Top = 153
  Width = 578
  Height = 326
  Caption = 'Maintain Slabs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 276
    Width = 570
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 203
    Width = 570
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      570
      73)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 16
      Width = 169
      Height = 17
      Caption = 'Show inactive slabs'
      TabOrder = 0
    end
    object btnAdd: TBitBtn
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 96
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 184
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 472
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 4
      OnClick = BitBtn4Click
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Load'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 570
    Height = 203
    Align = alClient
    DataSource = dtsSlabs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Length'
        Title.Caption = 'Length (mm)'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Depth'
        Title.Caption = 'Depth (mm)'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Size_Description'
        Title.Caption = 'Slab Description'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Code'
        Title.Caption = 'Stock Code'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = False
      end>
  end
  object qrySlabs: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop_Thickness_Slab_Size.Slab_Size_ID,'
      '        Worktop_Thickness_Slab_Size.Slab_Size_Description,'
      '        Worktop_Thickness_Slab_Size.Length,'
      '        Worktop_Thickness_Slab_Size.Depth,'
      '        Worktop_Thickness_Slab_Size.Stock_Item,'
      '        Worktop_Thickness_Slab_Size.inactive,'
      '        Stock_item.Stock_code,'
      '        Stock_item.Stock_Description'
      'FROM Stock_item'
      '        RIGHT JOIN Worktop_Thickness_Slab_Size'
      
        '          ON Stock_item.Stock_item = Worktop_Thickness_Slab_Size' +
        '.Stock_Item'
      'WHERE'
      '        ((Worktop_Thickness_Slab_Size.Worktop = :Worktop) AND'
      
        '        (Worktop_Thickness_Slab_Size.Thickness = :Thickness)) AN' +
        'D'
      
        '        ((Worktop_Thickness_Slab_Size.inactive = :inactive) or (' +
        'Worktop_Thickness_Slab_Size.inactive is NULL) or (Worktop_Thickn' +
        'ess_Slab_Size.inactive = '#39'N'#39'))'
      'ORDER BY'
      '        Worktop_Thickness_Slab_Size.Length,'
      '        Worktop_Thickness_Slab_Size.Depth'
      ''
      '')
    Left = 72
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object dtsSlabs: TDataSource
    DataSet = qrySlabs
    OnDataChange = dtsSlabsDataChange
    Left = 144
    Top = 120
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    Left = 232
    Top = 120
  end
  object qryAddSlab: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Worktop_Thickness_Slab_Size'
      '( Slab_Size_Description,'
      '  Length,'
      '  Depth,'
      '  Worktop,'
      '  Thickness,'
      '  Stock_Item'
      ')'
      'Values'
      '( :Slab_Size_Description,'
      '  :Length,'
      '  :Depth,'
      '  :Worktop,'
      '  :Thickness,'
      '  :Stock_Item'
      ')')
    Left = 376
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Slab_Size_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end>
  end
  object qryGetSlabs: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select'
      '  Slab_Size,'
      '  Length,'
      '  Depth,'
      '  Material_Type,'
      '  Slab_Size_Description'
      'FROM Material_Type_Slab_Size'
      'WHERE Material_Type = :Material_Type'
      'ORDER BY Length, Depth')
    Left = 376
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryAddStock: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Stock_Item'
      '        (Stock_Item,'
      '         Stock_Code,'
      '         Stock_Description)'
      'SELECT Max(Stock_Item)+1, '#39'Dummy'#39', :GUID'
      'FROM Stock_Item'
      '')
    Left = 376
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Stock_Item'
      'From Stock_Item'
      'Where Stock_Description = :GUID')
    Left = 448
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 504
    Top = 32
  end
  object qryUpdStock: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_Item'
      'SET Stock_Code = :Stock_Code,'
      '    Stock_Description = :Stock_Description'
      'WHERE Stock_Item = :Stock_Item')
    Left = 376
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end>
  end
end
