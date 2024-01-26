object frmWtLUWorktops: TfrmWtLUWorktops
  Left = 362
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Worktops'
  ClientHeight = 403
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 65
    Width = 777
    Height = 254
    Align = alClient
    DataSource = srcLUWorktops
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 294
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Group'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Show_Online'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Finish_Description'
        Title.Caption = 'Finish'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discount_Label'
        Title.Caption = 'Discount'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discount_Type'
        Title.Caption = 'Discount Type'
        Width = 85
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 384
    Width = 777
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 319
    Width = 777
    Height = 65
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      777
      65)
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object BitBtn1: TBitBtn
      Left = 335
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 421
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 508
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 681
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
    object btnThickness: TBitBtn
      Left = 249
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Prices'
      Enabled = False
      TabOrder = 4
      OnClick = btnThicknessClick
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 40
      Width = 169
      Height = 17
      Caption = 'Show inactive worktops'
      TabOrder = 5
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 12
      Width = 177
      Height = 21
      TabOrder = 6
      OnChange = edtNameChange
    end
    object btnExcel: TBitBtn
      Left = 594
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 7
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 65
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Material Type'
    end
    object SpeedButton2: TSpeedButton
      Left = 173
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
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Material_Type,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Worktop.inactive,'
      '        Worktop.Show_Online,'
      '        Worktop.Worktop_Finish,'
      '        Material_Type.Description AS Material_Description,'
      '        Discount.Discount_Label,'
      '        Discount.Discount_Type,'
      '        Worktop_Finish.Description as Finish_Description'
      'FROM Worktop_Finish'
      '        RIGHT JOIN (Discount'
      '        RIGHT JOIN (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        RIGHT JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      '          ON Discount.Discount = Worktop.Discount)'
      
        '          ON Worktop_Finish.Worktop_Finish = Worktop.Worktop_Fin' +
        'ish'
      
        'WHERE ((Worktop.Material_Type = :Material_Type) OR (:Material_Ty' +
        'pe = 0)) and'
      
        '  ((Worktop.inactive = :inactive) or (Worktop.inactive = '#39'N'#39') or' +
        ' (Worktop.inactive is NULL)) AND'
      '  (Worktop.Description LIKE :Description)'
      'ORDER BY Material_Type.Description, Worktop.Description')
    Left = 216
    Top = 16
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
    Left = 296
    Top = 16
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 376
    Top = 16
  end
end
