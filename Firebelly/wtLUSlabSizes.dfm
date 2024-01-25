object frmwtLUSlabSizes: TfrmwtLUSlabSizes
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Slab Sizes'
  ClientHeight = 277
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 484
    Height = 184
    Align = alClient
    DataSource = srcSlabSize
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
        FieldName = 'Slab_Size_Description'
        Title.Caption = 'Description'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Length'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Depth'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 258
    Width = 484
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
    Top = 184
    Width = 484
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      484
      74)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 89
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 170
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 340
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 17
      Width = 169
      Height = 17
      Caption = 'Show inactive slab sizes'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object tblSlabSize: TFDTable
    OnNewRecord = tblSlabSizeNewRecord
    Filtered = True
    IndexFieldNames = 'Slab_Size'
    ConnectionName = 'wt'
    TableName = 'Slab_Size'
    Left = 152
    Top = 64
    object tblSlabSizeSlab_Size: TIntegerField
      FieldName = 'Slab_Size'
    end
    object tblSlabSizeSlab_Size_Description: TStringField
      FieldName = 'Slab_Size_Description'
      Size = 100
    end
    object tblSlabSizeLength: TIntegerField
      FieldName = 'Length'
    end
    object tblSlabSizeDepth: TIntegerField
      FieldName = 'Depth'
    end
    object tblSlabSizeInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
  end
  object srcSlabSize: TDataSource
    DataSet = tblSlabSize
    Left = 192
    Top = 64
  end
  object qryNewSlabSize: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Slab_Size)'
      'from Slab_Size')
    Left = 280
    Top = 64
  end
end
