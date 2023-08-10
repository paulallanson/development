object frmWTLUMaterialUse: TfrmWTLUMaterialUse
  Left = 218
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Material Uses'
  ClientHeight = 305
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 710
    Height = 208
    Align = alClient
    DataSource = srcMaterialUse
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Use_Description'
        Title.Caption = 'Description'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Use_Type_Description'
        Title.Caption = 'Use Type'
        Width = 123
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 286
    Width = 710
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
    Top = 208
    Width = 710
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      710
      78)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 50
      Width = 169
      Height = 17
      Caption = 'Show inactive material uses'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 348
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object BitBtn3: TBitBtn
      Left = 432
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 600
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 5
    end
    object btnExcel: TBitBtn
      Left = 516
      Top = 13
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      NumGlyphs = 2
      TabOrder = 6
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object srcMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 168
    Top = 56
  end
  object qryMaterialUse: TFDQuery
    OnCalcFields = qryMaterialUseCalcFields
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Use'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Material_Use.Use_Description LIKE :Description)'
      'ORDER BY Use_Description'
      '')
    Left = 104
    Top = 56
    ParamData = <
      item
        Name = 'inactive'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryMaterialUseMaterial_Use: TIntegerField
      FieldName = 'Material_Use'
      Origin = 'Material_Use'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMaterialUseUse_Description: TWideStringField
      FieldName = 'Use_Description'
      Origin = 'Use_Description'
      Required = True
      Size = 50
    end
    object qryMaterialUseInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Required = True
      Size = 1
    end
    object qryMaterialUseUse_Type: TIntegerField
      FieldName = 'Use_Type'
      Origin = 'Use_Type'
    end
    object qryMaterialUseUse_Type_Description: TStringField
      FieldKind = fkCalculated
      FieldName = 'Use_Type_Description'
      Calculated = True
    end
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 240
    Top = 56
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
