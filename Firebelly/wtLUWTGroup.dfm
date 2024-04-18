object frmWTLUWTGroup: TfrmWTLUWTGroup
  Left = 263
  Top = 119
  BorderStyle = bsDialog
  Caption = 'Worktop Groups'
  ClientHeight = 297
  ClientWidth = 435
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
  object dbgDetails: TDBGrid
    Left = 0
    Top = 57
    Width = 435
    Height = 166
    Align = alClient
    DataSource = srcWTGroup
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
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Description'
        Width = 294
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 278
    Width = 435
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 269
    ExplicitWidth = 414
  end
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 435
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 214
    ExplicitWidth = 414
    object BitBtn1: TBitBtn
      Left = 8
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 336
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 6
      Width = 169
      Height = 17
      Caption = 'Show inactive groups'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 414
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Material Type'
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 8
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
    object btnLUMatType: TBitBtn
      Left = 160
      Top = 23
      Width = 22
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLUMatTypeClick
    end
  end
  object srcWTGroup: TDataSource
    DataSet = qryWTGroup
    OnDataChange = srcWTGroupDataChange
    Left = 112
    Top = 160
  end
  object lkpMatType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive is null) or (inactive = '#39#39')' +
        ')'
      'order by Description')
    Left = 256
    Top = 144
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 312
    Top = 144
  end
  object qryWTGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Worktop_Group'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '      Material_Type = :Material_Type'
      'ORDER BY Worktop_Group_Description'
      '')
    Left = 48
    Top = 160
    ParamData = <
      item
        Name = 'inactive'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 176
    Top = 160
  end
end
