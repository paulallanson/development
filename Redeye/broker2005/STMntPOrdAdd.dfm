object STMntPOrdAddFrm: TSTMntPOrdAddFrm
  Left = 11
  Top = 63
  Caption = 'Select Products To Order'
  ClientHeight = 464
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object NoOfItemsLabel: TLabel
    Left = 609
    Top = 288
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = '?? Items'
  end
  object PartsDBGrid: TDBGrid
    Left = 16
    Top = 8
    Width = 633
    Height = 273
    DataSource = PartsDataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = PartsDBGridCellClick
    OnDblClick = PartsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Part'
        Title.Caption = 'Product Code'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Description'
        Title.Caption = 'Description'
        Width = 285
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Purch_Pack_Quantity'
        Title.Caption = 'Pack Qty'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Part_Purchase_Price'
        Title.Caption = 'Cost'
        Width = 97
        Visible = True
      end>
  end
  object SearchGroupBox: TGroupBox
    Left = 16
    Top = 312
    Width = 345
    Height = 81
    Caption = 'Type here to narrow the search'
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Code'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object CodeEdit: TEdit
      Left = 96
      Top = 22
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = CodeEditChange
    end
    object DescrEdit: TEdit
      Left = 96
      Top = 46
      Width = 241
      Height = 21
      TabOrder = 1
      OnChange = DescrEditChange
    end
  end
  object CloseBitBtn: TBitBtn
    Left = 576
    Top = 416
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object SelectBitBtn: TBitBtn
    Left = 496
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Select'
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
    OnClick = SelectBitBtnClick
  end
  object SuppRadioGroup: TRadioGroup
    Left = 368
    Top = 312
    Width = 281
    Height = 81
    Caption = 'Source'
    ItemIndex = 0
    Items.Strings = (
      'Is the preferred source'
      'Is a possible source')
    ParentBackground = False
    TabOrder = 4
    OnClick = SuppRadioGroupClick
  end
  object StoreCheckBox: TCheckBox
    Left = 16
    Top = 288
    Width = 361
    Height = 17
    Caption = 'Just show the products usually stocked at this store'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = StoreCheckBoxClick
  end
  object PartsDataSource: TDataSource
    DataSet = GetPartsSQL
    Left = 360
    Top = 24
  end
  object GridTimer: TTimer
    Enabled = False
    OnTimer = GridTimerTimer
    Left = 312
    Top = 232
  end
  object GetPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      ''
      ' ')
    Left = 304
    Top = 136
  end
  object GetPOPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Part.Part, Part.Part_Description, Part.Part_Purchase_Pric' +
        'e,'
      '       Part.Purch_Pack_Quantity '
      'From Part, Part_Supplier'
      'Where (Part.Part Like XPAX) and'
      '      (Part.Part_Description Like XPDX ) and'
      '      (Part_Supplier.Part = Part.Part) and'
      '      (Part_Supplier.Supplier = :Supplier) and'
      '      (Part_Supplier.Branch_No = :Branch_No) and'
      
        '      (Part_Supplier.Supplier_Preference_Order <= :Pref_Source) ' +
        'and'
      '      (Part.Part Not In (Select Text100'
      '                                 From Int_Sel'
      '                                 Where (Int_Sel_Code = XUCX) and'
      
        '                                       (Text100 = Part.Part))) a' +
        'nd'
      
        '      (('#39'XMSX'#39' = '#39'N'#39') or Part.Part in (Select Part From Part_Sto' +
        're_Levels'
      
        '                                                       Where (Pa' +
        'rt_Store_Levels.Part = Part.Part) and'
      
        '                                                             (Pa' +
        'rt_Store_Levels.Part_Store_Type = XSTX)))'
      ''
      ''
      ''
      ' '
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 248
    Top = 168
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Pref_Source'
      end>
  end
  object GetSOPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part.Part, Part.Part_Description,'
      
        '       (Part.Part_Purchase_Price / Purch_Pack_Quantity) as Part_' +
        'Purchase_Price,'
      '       Purch_Pack_Quantity'
      'FROM Part'
      'Where'
      '      (Part.Part Like XPAX ) and'
      '      (Part.Part_Description Like XPDX ) and'
      '      ((Part.Part in (Select Part'
      '                     From Part_Store_Levels'
      
        '                     Where (Part.Part = Part_Store_Levels.Part) ' +
        'and'
      
        '                           (Part_Store_Levels.Part_Store_Type = ' +
        'XSTX))) or'
      
        '                                                ('#39'XMSX'#39' = '#39'N'#39')) ' +
        'and'
      '      ((Part.Part in (Select Part'
      '                     From Part_Store_Levels'
      
        '                     Where (Part.Part = Part_Store_Levels.Part) ' +
        'and'
      
        '                           (Part_Store_Levels.Part_Store_Type = ' +
        'XSTX) and'
      
        '                           (((Part_Store_Levels.Purchase_Or_Stor' +
        'e = '#39'S'#39') and'
      
        '                           (Part_Store_Levels.Replenish_Store = ' +
        ':From_Part_Store))))'
      
        '                                                              or' +
        ' (:Pref_Source > 0)))'
      ''
      'and'
      '      (Part.Part Not In (Select Text100'
      '                                 From Int_Sel'
      '                                 Where (Int_Sel_Code = XUCX) and'
      '                                       (Text100 = Part.Part)))'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 136
    ParamData = <
      item
        Name = 'From_Part_Store'
      end
      item
        Name = 'Pref_Source'
      end>
  end
  object GetDiscRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Supplier.Discount, Part_Supplier.Discount as Part_Discoun' +
        't'
      'From Supplier, Part_Supplier'
      'where ((Supplier.Supplier = Part_Supplier.Supplier) and'
      '    (Part_Supplier.Part = :Part) and'
      '    (Supplier.Supplier = :Supplier) and'
      '    (Part_Supplier.Discount_This_Part = '#39'Y'#39'))')
    Left = 448
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Supplier'
      end>
  end
end
