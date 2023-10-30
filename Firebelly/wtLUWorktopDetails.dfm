object frmWTLUWorktopDetails: TfrmWTLUWorktopDetails
  Left = 279
  Top = 111
  Caption = 'Maintain Worktop Prices'
  ClientHeight = 490
  ClientWidth = 975
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 471
    Width = 975
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
    ExplicitTop = 462
    ExplicitWidth = 969
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 975
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 392
    ExplicitWidth = 969
    DesignSize = (
      975
      70)
    object Label4: TLabel
      Left = 16
      Top = 21
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object BitBtn1: TBitBtn
      Left = 556
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitLeft = 550
    end
    object btnEdit: TBitBtn
      Left = 639
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      ExplicitLeft = 633
    end
    object btnDelete: TBitBtn
      Left = 722
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 716
    end
    object BitBtn4: TBitBtn
      Left = 889
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      ExplicitLeft = 883
    end
    object btnThickness: TBitBtn
      Left = 473
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Prices'
      Enabled = False
      TabOrder = 4
      ExplicitLeft = 467
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 45
      Width = 169
      Height = 17
      Caption = 'Show inactive worktops'
      TabOrder = 5
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 17
      Width = 177
      Height = 21
      TabOrder = 6
      OnChange = edtNameChange
    end
    object btnExcel: TBitBtn
      Left = 805
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 7
      OnClick = btnExcelClick
      ExplicitLeft = 799
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 969
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Material Type'
    end
    object SpeedButton2: TSpeedButton
      Left = 165
      Top = 31
      Width = 23
      Height = 22
      Hint = 'Clear Material Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 65
    Width = 975
    Height = 336
    Align = alClient
    DataSource = srcLUWorktops
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
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 257
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Group'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Price'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 135
        Visible = True
      end>
  end
  object lkpMatType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')')
    Left = 208
    Top = 168
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 280
    Top = 168
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Worktop_thickness.Worktop,'
      '    Worktop_thickness.Thickness,'
      '    Worktop_thickness.Price_pointer,'
      '    Worktop.Description,'
      '    Worktop.Material_Type,'
      '    Worktop.Worktop_Group,'
      '    Worktop.inactive,'
      '    Material_Type.Description as Material_Description,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    Thickness.Thickness_mm,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'FROM Thickness'
      '      INNER JOIN (Worktop_Group'
      '      RIGHT JOIN (Material_Type'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN Worktop_thickness'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      
        'WHERE ((Worktop.Material_Type = :Material_Type) OR (:Material_Ty' +
        'pe = 0)) AND'
      
        '      ((Worktop.inactive = :inactive) OR (Worktop.inactive = '#39'N'#39 +
        ') or (Worktop.inactive is NULL)) AND'
      '      (Worktop.Description LIKE :Description)'
      
        'ORDER BY Material_Type.Description, Worktop_Group.Worktop_Group_' +
        'Description, Worktop.Description, Thickness.Thickness_mm'
      '')
    Left = 392
    Top = 176
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object srcLUWorktops: TDataSource
    DataSet = qryWorktops
    OnDataChange = srcLUWorktopsDataChange
    Left = 472
    Top = 176
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
