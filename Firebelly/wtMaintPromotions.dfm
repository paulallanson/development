object frmWTMaintPromotions: TfrmWTMaintPromotions
  Left = 344
  Top = 48
  Caption = 'Promotions'
  ClientHeight = 503
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 17
      Caption = 'Description:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 100
      Height = 17
      Caption = 'Maximum Entries'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object spnMaxEntries: TSpinEdit
      Left = 114
      Top = 40
      Width = 57
      Height = 27
      MaxValue = 20
      MinValue = 0
      TabOrder = 0
      Value = 6
    end
    object edtPromotionDescription: TEdit
      Left = 114
      Top = 12
      Width = 409
      Height = 25
      TabOrder = 1
      Text = 'edtPromotionDescription'
      OnChange = EnableOK
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 622
    Height = 389
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 154
      Height = 17
      Caption = 'Currently Selected Colours'
    end
    object Label4: TLabel
      Left = 344
      Top = 8
      Width = 119
      Height = 17
      Caption = 'Un-Selected Colours'
    end
    object Label5: TLabel
      Left = 344
      Top = 36
      Width = 82
      Height = 17
      Caption = 'Material Type:'
    end
    object Label6: TLabel
      Left = 344
      Top = 347
      Width = 39
      Height = 17
      Caption = 'Search'
    end
    object lstbxMembers: TListBox
      Left = 8
      Top = 68
      Width = 233
      Height = 177
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 0
      OnClick = lstbxMembersClick
      OnDblClick = lstbxMembersDblClick
    end
    object lstbxMembersCodes: TListBox
      Left = 128
      Top = 72
      Width = 41
      Height = 140
      ItemHeight = 17
      TabOrder = 1
      Visible = False
    end
    object btnAdd: TBitBtn
      Left = 253
      Top = 76
      Width = 81
      Height = 25
      Caption = '&Add'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnRemove: TBitBtn
      Left = 253
      Top = 116
      Width = 81
      Height = 25
      Caption = '&Remove'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnRemoveClick
    end
    object lstbxNonMembers: TListBox
      Left = 344
      Top = 68
      Width = 233
      Height = 265
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 4
      OnClick = lstbxNonMembersClick
      OnDblClick = lstbxNonMembersDblClick
    end
    object lstbxNonMembersCodes: TListBox
      Left = 472
      Top = 72
      Width = 41
      Height = 140
      ItemHeight = 17
      TabOrder = 5
      Visible = False
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 436
      Top = 32
      Width = 161
      Height = 25
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtsMaterialType
      TabOrder = 6
      OnClick = dblkpMaterialTypeClick
    end
    object edtSearch: TEdit
      Left = 391
      Top = 343
      Width = 183
      Height = 25
      TabOrder = 7
      Text = 'edtSearch'
      OnChange = edtSearchChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 462
    Width = 622
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOK: TBitBtn
      Left = 212
      Top = 8
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
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 300
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object chkbxInactive: TCheckBox
      Left = 13
      Top = 12
      Width = 97
      Height = 17
      Caption = 'Inactive'
      TabOrder = 2
    end
  end
  object qryDeleteWT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Promotion_Worktops'
      'where Promotion_Code = :Promotion_Code')
    Left = 216
    Top = 56
    ParamData = <
      item
        Name = 'Promotion_Code'
      end>
  end
  object qryAddWT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert into Promotion_Worktops'
      '(Promotion_Code,'
      'Entry_Number,'
      'Worktop'
      ')'
      'values'
      '(  :Promotion_Code,'
      '  :Entry_Number,'
      '  :Worktop'
      ')'
      '')
    Left = 136
    Top = 56
    ParamData = <
      item
        Name = 'Promotion_Code'
      end
      item
        Name = 'Entry_Number'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryMembers: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Promotion_Worktops.Promotion_Code,'
      '        Promotion_Worktops.Entry_Number,'
      '        Promotion_Worktops.Worktop,'
      '        Worktop.Description AS Worktop_Description,'
      '        Material_Type.Description AS Material_Type_Description'
      'FROM Material_Type'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN Promotion_Worktops'
      '        ON Worktop.Worktop = Promotion_Worktops.Worktop)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type'
      'WHERE Promotion_Worktops.Promotion_Code = :Promotion_Code'
      'Order By Worktop.Description'
      '')
    Left = 30
    Top = 276
    ParamData = <
      item
        Name = 'Promotion_Code'
      end>
  end
  object qryNonMembers: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Worktop_Group,'
      '        Worktop.inactive,'
      '        Worktop_Group.Worktop_Group_Description'
      'FROM Worktop_Group'
      '      INNER JOIN Worktop'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group'
      'WHERE Worktop.Material_Type = :Material_Type')
    Left = 252
    Top = 226
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsNonMembers: TDataSource
    DataSet = qryNonMembers
    Left = 252
    Top = 366
  end
  object qryDummy: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description AS Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Worktop_Group,'
      '        Worktop.inactive,'
      '        Material_Type.Description as Material_Type_Description'
      'FROM Material_Type'
      
        '      RIGHT JOIN Worktop ON Material_Type.Material_Type = Workto' +
        'p.Material_Type'
      'WHERE Worktop.Show_Online = '#39'Y'#39' AND'
      '      Worktop.Inactive = '#39'N'#39' AND'
      '      Worktop.Material_Type = :Material_Type AND'
      '      Worktop.Description LIKE :Description'
      '')
    Left = 267
    Top = 354
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Description'
      end>
  end
  object dtsMaterialType: TDataSource
    DataSet = qryMaterialType
    Left = 484
    Top = 42
  end
  object qryMaterialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Type'
      'WHERE (Show_Online = '#39'Y'#39') AND'
      
        '      ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')'
      'ORDER BY Material_Type.Description')
    Left = 453
    Top = 5
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 120
    Top = 276
  end
  object qryUpdActive: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Promotion'
      'SET inactive = '#39'Y'#39
      'WHERE Promotion_Code <> :Promotion_Code')
    Left = 50
    Top = 386
    ParamData = <
      item
        Name = 'Promotion_Code'
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Promotion'
      'SET'
      '      Promotion_Description = :Promotion_Description,'
      '      Maximum_Entries = :Maximum_Entries,'
      '      inActive = :inactive'
      'WHERE'
      '  Promotion_Code = :Promotion_Code')
    Left = 80
    Top = 112
    ParamData = <
      item
        Name = 'Promotion_Description'
      end
      item
        Name = 'Maximum_Entries'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Promotion_Code'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Promotion'
      '('
      '        Promotion_Description,'
      '        Maximum_Entries,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Promotion_Description,'
      '        :Maximum_Entries,'
      '        :inactive'
      ')'
      ' ')
    Left = 136
    Top = 112
    ParamData = <
      item
        Name = 'Promotion_Description'
      end
      item
        Name = 'Maximum_Entries'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Promotion_Code) as Promotion_Code'
      'From Promotion')
    Left = 274
    Top = 244
  end
end
